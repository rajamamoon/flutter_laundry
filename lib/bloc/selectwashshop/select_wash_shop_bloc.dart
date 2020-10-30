import 'package:bloc/bloc.dart';
import 'package:whitedrywash/model/drywashitem/dry_wash_item_response.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_master.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import 'package:whitedrywash/model/selectwashshop/wash_item_return_master.dart';
import 'package:whitedrywash/service/viewmodel/api_provider.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'select_wash_shop_event.dart';
import 'select_wash_shop_state.dart';

class SelectWashShopBloc
    extends Bloc<SelectWashShopEvent, SelectWashShopState> {
  final ApiProvider apiProvider = ApiProvider();
  List<DryWashItemResponse> dryWashItemList;

  void washItem(List<DryWashItemResponse> dryWashItemList) {
    this.dryWashItemList = dryWashItemList;
  }

  void city(callback) {
    add(SelectCity(callback: callback));
  }

  void cityName(String cityName) {
    add(CityName(cityName: cityName));
  }

  void areaName(String areaName) {
    add(AreaName(areaName: areaName));
  }

  void washShopDetail(
      int washShopId, String washShopName, String washShopAddress) {
    add(WashShopDetail(
        washShopId: washShopId,
        washShopName: washShopName,
        washShopAddress: washShopAddress));
  }

  void area(callback) {
    add(SelectArea(callback: callback));
  }

  void selectWashShop(callback) {
    add(SelectWashShop(callback: callback));
  }

  void selectWashShopItem() {
    add(SelectWashShopItem());
  }

  void clearWashShopDetail() {
    add(ClearWashShopDetail());
    add(SelectWashShopItem());
  }

  @override
  SelectWashShopState get initialState => SelectWashShopState.initial();

  @override
  Stream<SelectWashShopState> mapEventToState(
      SelectWashShopEvent event) async* {
    if (event is ClearWashShopDetail) {
      yield state.copyWith(
          washItemReturnMasterList: List(),
          washTotal: 0.0,
          washShopAddress: null,
          washShopName: null,
          washShopId: 0,
          areaName: null,
          cityName: null);
    }

    if (event is CityName) {
      yield state.copyWith(cityName: event.cityName);
    }

    if (event is AreaName) {
      yield state.copyWith(areaName: event.areaName);
    }

    if (event is WashShopDetail) {
      yield state.copyWith(
          washShopId: event.washShopId,
          washShopName: event.washShopName,
          washShopAddress: event.washShopAddress);
    }

    if (event is SelectCity) {
      yield state.copyWith(loadingSelect: true);
      await apiProvider.getSelectShopWash();

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          List<String> cityList = new List();
          for (SelectWashShopResponse city in response) {
            cityList.add(city.city);
          }

          yield state.copyWith(loadingSelect: false);
          event.callback(List<String>.from(Set<String>.from(cityList)));
        } else {
          yield state.copyWith(
              loadingSelect: false,
              errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loadingSelect: false, errorMessage: e.toString());
      }
    }

    if (event is SelectArea) {
      yield state.copyWith(loadingSelect: true);
      await apiProvider.getSelectShopWash();

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          var areaFilterList =
              response.where((user) => user.city == state.cityName).toList();
          List<String> areaList = new List();
          for (SelectWashShopResponse city in areaFilterList) {
            areaList.add(city.area);
          }
          yield state.copyWith(loadingSelect: false);
          event.callback(List<String>.from(Set<String>.from(areaList)));
        } else {
          yield state.copyWith(
              loadingSelect: false,
              errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loadingSelect: false, errorMessage: e.toString());
      }
    }

    if (event is SelectWashShop) {
      yield state.copyWith(loadingSelect: true);
      await apiProvider.getSelectShopWash();

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          var washShopFilterList = response
              .where((washShop) =>
                  washShop.city == state.cityName &&
                  washShop.area == state.areaName)
              .toList();
          yield state.copyWith(loadingSelect: false);
          event.callback(washShopFilterList);
        } else {
          yield state.copyWith(
              loadingSelect: false,
              errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loadingSelect: false, errorMessage: e.toString());
      }
    }

    if (event is SelectWashShopItem) {
      if (!state.loadingSelect) {
        yield state.copyWith(loadingSelect: true);
      }
      yield state.copyWith(washTotal: 0.0, washItemReturnMasterList: List());
      await apiProvider.getSelectShopWash();
      var washTotal = 0.0;
      List<WashItemReturnMaster> filterDataList = new List();

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          if (state.washShopId != 0) {
            var response = apiProvider.apiResult.response;
            List<SelectWashShopResponse> washShopFilterList = response
                .where((washShop) => washShop.id == state.washShopId)
                .toList();
            List<SelectWashMaster> selectWashMasterList = washShopFilterList[0]
                .selectWashMasterList
                .where((user) => user.shopId == state.washShopId)
                .toList();

            for (DryWashItemResponse dryWashItemResponse in dryWashItemList) {
              for (SelectWashMaster selectWashMaster in selectWashMasterList) {
                if (dryWashItemResponse.productId == selectWashMaster.categoryId) {

                  filterDataList.add(WashItemReturnMaster(
                      selectWashMaster,
                      dryWashItemResponse.quantity,
                      dryWashItemResponse.washWater,
                      selectWashMaster.washShopStatus ? dryWashItemResponse.quantity * selectWashMaster.price +
                          (dryWashItemResponse.washWater
                              ? selectWashMaster.water *
                                  dryWashItemResponse.quantity
                              : 0.0) : 0.0));
                }
              }
            }

            washTotal = filterDataList.fold(0, (t, e) => t + e.totalPrice);

          } else {
            for (DryWashItemResponse dryWashItemResponse in dryWashItemList) {
              filterDataList.add(WashItemReturnMaster(
                  SelectWashMaster(
                      shopId: 0,
                      menuId: 0,
                      categoryId: 0,
                      menuName: dryWashItemResponse.menuName,
                      categoryName: dryWashItemResponse.productName,
                      water: 0.0,
                      price: 0.0,
                      washShopStatus: true),
                  dryWashItemResponse.quantity,
                  dryWashItemResponse.washWater,
                  0.0));
            }
          }

          yield state.copyWith(
              loadingSelect: false,
              washTotal: washTotal,
              washItemReturnMasterList: filterDataList);
        } else {
          yield state.copyWith(
              loadingSelect: false,
              errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loadingSelect: false, errorMessage: e.toString());
      }
    }
  }
}

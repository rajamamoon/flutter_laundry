import 'package:bloc/bloc.dart';
import 'package:whitedrywash/model/drywashitem/dry_wash_item_response.dart';
import 'package:whitedrywash/service/viewmodel/api_provider.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'dry_wash_event.dart';
import 'dry_wash_state.dart';

class DryWashBloc extends Bloc<DryWashEvent, DryWashState> {
  final ApiProvider apiProvider = ApiProvider();
  int id, productId, washItemQuantityNo;
  bool select;
  DryWashItemResponse dryWashItemResponse;

  void dryWash() {
    add(DryWash());
  }

  void selectCloth(int id, int productId, bool select) {
    this.id = id;
    this.productId = productId;
    this.select = select;

    add(SelectCloth());
  }

  void washItem() {
    add(WashItem());
  }

  void washItemQuantity(int productId, int washItemQuantityNo) {
    this.productId = productId;
    this.washItemQuantityNo = washItemQuantityNo;
    add(WashItemQuantity());
  }

  void washItemDelete(int id, int productId) {
    this.id = id;
    this.productId = productId;
    add(WashItemDelete());
  }

  void washItemWashWater(int productId, bool select) {
    this.productId = productId;
    this.select = select;
    add(WashItemWashWater());
  }

  void dryWashSelect(callback) {
    add(DryWashSelect(callback: callback));
  }

  @override
  DryWashState get initialState => DryWashState.initial();

  @override
  Stream<DryWashState> mapEventToState(DryWashEvent event) async* {
    if (event is DryWash) {
      yield state.copyWith(
          dryWashList: List(), dryWashItemList: List(), loading: true);
      await apiProvider.getDryWash();

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          yield state.copyWith(loading: false, dryWashList: response);
        } else {
          yield state.copyWith(
              loading: false, errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loading: false, errorMessage: e.toString());
        event.callback('Error, Something bad happened.');
      }
    }

    if (event is SelectCloth) {
      try {
        int checkData = state.dryWashList.indexWhere((item) => item.id == id);
        if (checkData != -1) //If id not match then return -1
        {
          int getProductId = state.dryWashList[checkData].dryWashItemList
              .indexWhere((item) => item.id == productId);
          state.dryWashList[checkData].dryWashItemList[getProductId].isSelect =
              select;

          if (select) {
            state.dryWashItemList.add(DryWashItemResponse(
                id: id,
                productId: productId,
                menuName: state.dryWashList[checkData].name,
                productName: state
                    .dryWashList[checkData].dryWashItemList[getProductId].name,
                washWater: false,
                quantity: 1));
          } else {
            state.dryWashItemList
                .removeWhere((item) => item.productId == productId);
          }

          yield state.copyWith(loading: false, dryWashList: state.dryWashList);
        }
      } catch (e) {
        print(e.toString());
        event.callback('Error, Something bad happened.');
      }
    }

    if (event is WashItem) {
      event.callback(dryWashItemList: state.dryWashItemList);
    }

    if (event is WashItemQuantity) {
      int checkData = state.dryWashItemList
          .indexWhere((item) => item.productId == productId);
      state.dryWashItemList[checkData].quantity = washItemQuantityNo;
    }

    if (event is WashItemDelete) {
      int checkData = state.dryWashList.indexWhere((item) => item.id == id);
      if (checkData != -1) //If id not match then return -1
      {
        int getProductId = state.dryWashList[checkData].dryWashItemList
            .indexWhere((item) => item.id == productId);
        state.dryWashList[checkData].dryWashItemList[getProductId].isSelect =
            false;
      }

      state.dryWashItemList.removeWhere((item) => item.productId == productId);
      yield state.copyWith(dryWashItemList: state.dryWashItemList);
    }

    if (event is WashItemWashWater) {
      int checkData = state.dryWashItemList
          .indexWhere((item) => item.productId == productId);

      state.dryWashItemList[checkData].washWater = select;
      yield state.copyWith(dryWashItemList: state.dryWashItemList);
    }

    if (event is DryWashSelect) {
      int selectDryWashItem = state.dryWashItemList.length;
      event.callback(selectDryWashItem);
    }
  }
}

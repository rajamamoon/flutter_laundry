import 'package:meta/meta.dart';
import 'package:whitedrywash/model/selectwashshop/wash_item_return_master.dart';

class SelectWashShopState {
  bool loading, loadingSelect;
  String errorMessage;
  List<WashItemReturnMaster> washItemReturnMasterList;
  double washTotal;
  String cityName;
  String areaName;
  int washShopId;
  String washShopName;
  String washShopAddress;

  SelectWashShopState(
      {@required this.loading,
      this.loadingSelect,
      this.errorMessage,
      this.washItemReturnMasterList,
      this.washTotal,
      this.cityName,
      this.areaName,
      this.washShopId,
      this.washShopName,
      this.washShopAddress});

  factory SelectWashShopState.initial() {
    return SelectWashShopState(
        loading: false,
        loadingSelect: false,
        errorMessage: '',
        washItemReturnMasterList: List(),
        washTotal: 0.0,
        cityName: null,
        areaName: null,
        washShopId: 0,
        washShopName: null,
        washShopAddress: null);
  }

  SelectWashShopState copyWith(
      {bool loading,
      bool loadingSelect,
      String errorMessage,
      List<WashItemReturnMaster> washItemReturnMasterList,
      double washTotal,
      String cityName,
      String areaName,
      int washShopId,
      String washShopName,
      String washShopAddress}) {
    return SelectWashShopState(
        loading: loading ?? this.loading,
        loadingSelect: loadingSelect ?? this.loadingSelect,
        errorMessage: errorMessage ?? this.errorMessage,
        washItemReturnMasterList:
            washItemReturnMasterList ?? this.washItemReturnMasterList,
        washTotal: washTotal ?? this.washTotal,
        cityName: cityName ?? this.cityName,
        areaName: areaName ?? this.areaName,
        washShopId: washShopId ?? this.washShopId,
        washShopName: washShopName ?? this.washShopName,
        washShopAddress: washShopAddress ?? this.washShopAddress);
  }
}

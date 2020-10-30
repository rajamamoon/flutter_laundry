import 'package:meta/meta.dart';
import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/model/drywashitem/dry_wash_item_response.dart';

class DryWashState {
  bool loading;
  String errorMessage;
  final List<DryWashResponse> dryWashList;
  final List<DryWashItemResponse> dryWashItemList;

  DryWashState(
      {@required this.loading,
      this.errorMessage,
      this.dryWashList,
      this.dryWashItemList});

  factory DryWashState.initial() {
    return DryWashState(
        loading: false,
        errorMessage: '',
        dryWashList: List(),
        dryWashItemList: List());
  }

  DryWashState copyWith(
      {bool loading,
      String errorMessage,
      List<DryWashResponse> dryWashList,
      List<DryWashItemResponse> dryWashItemList}) {
    return DryWashState(
        loading: loading ?? this.loading,
        errorMessage: errorMessage ?? this.errorMessage,
        dryWashList: dryWashList ?? this.dryWashList,
        dryWashItemList: dryWashItemList ?? this.dryWashItemList);
  }
}

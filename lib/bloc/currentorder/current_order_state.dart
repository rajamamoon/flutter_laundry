import 'package:meta/meta.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';

class CurrentOrderState {
  bool loading;
  String errorMessage;
  final String userId;
  final List<CurrentOrderResponse> currentOrderList;

  CurrentOrderState(
      {@required this.loading,
      this.errorMessage,
      this.userId,
      this.currentOrderList});

  factory CurrentOrderState.initial() {
    return CurrentOrderState(
        loading: false,
        errorMessage: '',
        userId: null,
        currentOrderList: List());
  }

  CurrentOrderState copyWith(
      {bool loading,
      String errorMessage,
      String userId,
      List<CurrentOrderResponse> currentOrderList}) {
    return CurrentOrderState(
        loading: loading ?? this.loading,
        errorMessage: errorMessage ?? this.errorMessage,
        userId: userId ?? this.userId,
        currentOrderList: currentOrderList ?? this.currentOrderList);
  }
}

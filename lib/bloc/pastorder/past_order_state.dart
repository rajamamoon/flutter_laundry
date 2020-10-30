import 'package:meta/meta.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';

class PastOrderState {
  bool loading;
  String errorMessage;
  final String userId;
  final List<PastOrderResponse> pastOrderList;

  PastOrderState(
      {@required this.loading,
      this.errorMessage,
      this.userId,
      this.pastOrderList});

  factory PastOrderState.initial() {
    return PastOrderState(
        loading: false,
        errorMessage: '',
        userId: null,
        pastOrderList: List());
  }

  PastOrderState copyWith(
      {bool loading,
      String errorMessage,
      String userId,
      List<PastOrderResponse> pastOrderList}) {
    return PastOrderState(
        loading: loading ?? this.loading,
        errorMessage: errorMessage ?? this.errorMessage,
        userId: userId ?? this.userId,
        pastOrderList: pastOrderList ?? this.pastOrderList);
  }
}

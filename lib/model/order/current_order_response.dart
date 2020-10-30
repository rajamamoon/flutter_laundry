class CurrentOrderResponse {
  final String orderId;
  final String shopName;
  final String shopAddress;
  final String shopMobileNo;
  final String deliveryAddress;
  final String orderAmount;
  final String payAmount;
  final String orderType;
  final String orderStatus;
  final String orderDate;
  final String deliveryDate;

  CurrentOrderResponse({this.orderId, this.shopName, this.shopAddress, this.shopMobileNo, this.deliveryAddress, this.orderAmount, this.payAmount, this.orderType, this.orderStatus, this.orderDate, this.deliveryDate});
}

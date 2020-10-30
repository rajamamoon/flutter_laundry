class PastOrderResponse {
  final String orderId;
  final String shopName;
  final String shopAddress;
  final String shopMobileNo;
  final String deliveryAddress;
  final String orderAmount;
  final String orderType;
  final String orderStatus;
  final String orderDate;
  final String deliveryDate;

  PastOrderResponse(
      {this.orderId,
      this.shopName,
      this.shopAddress,
      this.shopMobileNo,
      this.deliveryAddress,
      this.orderAmount,
      this.orderType,
      this.orderStatus,
      this.orderDate,
      this.deliveryDate});
}

class OrderJson {
  final String userId;
  final String shopId;
  final String totalPay;
  final String totalAmount;
  final String pendingAmount;
  final String userName;
  final String mobile;
  final String address;
  final String washType;

  OrderJson(
      this.userId,
      this.shopId,
      this.totalPay,
      this.totalAmount,
      this.pendingAmount,
      this.userName,
      this.mobile,
      this.address,
      this.washType);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'shopId': shopId,
        'totalPay': totalPay,
        'totalAmount': totalAmount,
        'pendingAmount': pendingAmount,
        'userName': userName,
        'mobile': mobile,
        'address': address,
        'washType': washType
      };
}

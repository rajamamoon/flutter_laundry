import 'package:meta/meta.dart';

class WashDeliveryAddressState {
  final String name;
  final String mobile;
  final String address;
  final String washType;
  final String washShopPay;
  bool loading;

  WashDeliveryAddressState({
    bool loading,
    @required this.name,
    @required this.mobile,
    @required this.address,
    @required this.washType,
    this.washShopPay,
  });

  factory WashDeliveryAddressState.initial() {
    return WashDeliveryAddressState(loading: false,
        name: "", mobile: "", address: "", washType: "", washShopPay: null);
  }

  WashDeliveryAddressState copyWith(
      {bool loading,
      String name,
      String mobile,
      String address,
      String washType,
      String washShopPay}) {
    return WashDeliveryAddressState(
        loading: loading ?? this.loading,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        address: address ?? this.address,
        washType: washType ?? this.washType,
        washShopPay: washShopPay ?? this.washShopPay);
  }
}

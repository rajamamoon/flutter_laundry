abstract class WashDeliveryAddressEvent {}

class MobileInput extends WashDeliveryAddressEvent {
  final String mobile;
  MobileInput({this.mobile});
}

class NameInput extends WashDeliveryAddressEvent {
  final String name;
  NameInput({this.name});
}

class WashShopPayInput extends WashDeliveryAddressEvent {
  final String washShopPay;
  WashShopPayInput({this.washShopPay});
}

class AddressInput extends WashDeliveryAddressEvent {
  final String address;
  AddressInput({this.address});
}

class WashTypeInput extends WashDeliveryAddressEvent {
  final String washTypeInput;
  WashTypeInput({this.washTypeInput});
}


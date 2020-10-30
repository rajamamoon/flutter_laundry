abstract class SelectWashShopEvent {}

class CityName extends SelectWashShopEvent {
  final String cityName;
  CityName({this.cityName});
}

class AreaName extends SelectWashShopEvent {
  final String areaName;
  AreaName({this.areaName});
}

class WashShopDetail extends SelectWashShopEvent {
  final int washShopId;
  final String washShopName;
  final String washShopAddress;
  WashShopDetail({this.washShopId, this.washShopName, this.washShopAddress});
}

class SelectCity extends SelectWashShopEvent {
  Function callback;
  SelectCity({this.callback});
}

class SelectArea extends SelectWashShopEvent {
  Function callback;
  SelectArea({this.callback});
}

class SelectWashShop extends SelectWashShopEvent {
  Function callback;
  SelectWashShop({this.callback});
}

class SelectWashShopItem extends SelectWashShopEvent {}

class ClearWashShopDetail extends SelectWashShopEvent {}

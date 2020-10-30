import 'select_wash_master.dart';

class SelectWashShopResponse {
  int id;
  String city;
  String area;
  String name;
  String address;
  List<SelectWashMaster> selectWashMasterList;

  SelectWashShopResponse({this.id, this.city, this.area, this.name, this.address, this.selectWashMasterList});
}

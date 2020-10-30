import 'dry_wash_item.dart';

class DryWashResponse {
  int id;
  String name;
  List<DryWashItem> dryWashItemList;

  DryWashResponse({this.id, this.name, this.dryWashItemList});
}

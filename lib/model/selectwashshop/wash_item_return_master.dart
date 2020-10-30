import 'package:whitedrywash/model/selectwashshop/select_wash_master.dart';

class WashItemReturnMaster {
  SelectWashMaster selectWashMaster;
  int quantity;
  bool washWater;
  double totalPrice;

  WashItemReturnMaster(this.selectWashMaster, this.quantity, this.washWater, this.totalPrice);
}

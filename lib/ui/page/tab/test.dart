import 'package:whitedrywash/model/selectwashshop/select_wash_master.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import 'package:whitedrywash/service/viewmodel/api_view_model.dart';

void main(){
  List<SelectWashShopResponse> washShopFilterList = getSelectWashShop().where((user) => user.id == 1).toList();
  List<SelectWashMaster> selectWashMasterList = washShopFilterList[0].selectWashMasterList.where((user) => user.shopId == 1).toList();
  print('Tag' + selectWashMasterList[0].categoryName);
}
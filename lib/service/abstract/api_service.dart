import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import '../network_service_response.dart';

abstract class APIService {
  login(String mobile, String password);
  Future<NetworkServiceResponse<List<CurrentOrderResponse>>> currentOrderList(String userId);
  Future<NetworkServiceResponse<List<PastOrderResponse>>> pastOrderList(String userId);
  Future<NetworkServiceResponse<List<DryWashResponse>>> dryWash();

  Future<NetworkServiceResponse<List<SelectWashShopResponse>>> selectWashShopList();
}

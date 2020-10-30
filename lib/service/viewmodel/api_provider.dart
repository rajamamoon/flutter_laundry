import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import 'package:whitedrywash/service/abstract/api_service.dart';
import 'package:whitedrywash/service/di/dependency_injection.dart';
import '../network_service_response.dart';

class ApiProvider {
  NetworkServiceResponse apiResult;
  APIService apiService = new Injector().flavor;

  getLogin(String mobile, String password) async {
    NetworkServiceResponse result = await apiService.login(mobile, password);
    this.apiResult = result;
  }

  Future getCurrentOrderList(String userId) async {
    NetworkServiceResponse<List<CurrentOrderResponse>> result =
        await apiService.currentOrderList(userId);
    this.apiResult = result;
  }

  Future getPastOrderList(String userId) async {
    NetworkServiceResponse<List<PastOrderResponse>> result =
        await apiService.pastOrderList(userId);
    this.apiResult = result;
  }

  Future getDryWash() async {
    NetworkServiceResponse<List<DryWashResponse>> result =
    await apiService.dryWash();
    this.apiResult = result;
  }

  Future getSelectShopWash() async {
    NetworkServiceResponse<List<SelectWashShopResponse>> result =
    await apiService.selectWashShopList();
    this.apiResult = result;
  }
}

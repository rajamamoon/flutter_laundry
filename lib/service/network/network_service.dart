import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import 'package:whitedrywash/service/abstract/api_service.dart';
import 'package:whitedrywash/service/network_service_response.dart';
import '../network_type.dart';
import '../restclient.dart';

class NetworkService extends NetworkType implements APIService {
  static final _baseUrl = '';
  final _loginUrl = _baseUrl + '';

  var headers = {
    "Content-Type": 'application/json',
    "AUTH_KEY": '',
  };

  NetworkService(RestClient rest) : super(rest);

  @override
  Future login(String mobile, String password) async {
  return null;
  }

  @override
  Future<NetworkServiceResponse<List<CurrentOrderResponse>>> currentOrderList(String userId) {
    return null;
  }

  @override
  Future<NetworkServiceResponse<List<PastOrderResponse>>> pastOrderList(String userId) {
    throw null;
  }

  @override
  Future<NetworkServiceResponse<List<DryWashResponse>>> dryWash() {
    throw null;
  }

  @override
  Future<NetworkServiceResponse<List<SelectWashShopResponse>>> selectWashShopList() {
    return null;
  }
}

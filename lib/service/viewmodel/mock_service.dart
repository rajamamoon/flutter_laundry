import 'dart:async';
import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/model/login/login_response.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import 'package:whitedrywash/service/abstract/api_service.dart';
import 'package:whitedrywash/service/viewmodel/api_view_model.dart';
import 'package:whitedrywash/utils/vars.dart';
import '../network_service_response.dart';

class MockService implements APIService {
  @override
  login(String mobile, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(
        responseCode: ok200,
        errorMessage: 'Login successful',
        response: LoginResponse(
          userId: '0001',
          name: 'Admin',
          email: 'admin@gmail.com',
          mobile: '1234567890',
          address: '',
          profilePicture:  ''
        )));
  }

  @override
  Future<NetworkServiceResponse<List<CurrentOrderResponse>>> currentOrderList(String userId) async{
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getCurrentOrder(), errorMessage: null));
  }

  @override
  Future<NetworkServiceResponse<List<PastOrderResponse>>> pastOrderList(String userId) async{
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getPastOrder(), errorMessage: null));
  }

  @override
  Future<NetworkServiceResponse<List<DryWashResponse>>> dryWash() async{
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getDryWash(), errorMessage: null));
  }

  @override
  Future<NetworkServiceResponse<List<SelectWashShopResponse>>> selectWashShopList() async{
    await Future.delayed(Duration(seconds: 1));
    return Future.value(NetworkServiceResponse(responseCode: ok200, response: getSelectWashShop(), errorMessage: null));
  }
}

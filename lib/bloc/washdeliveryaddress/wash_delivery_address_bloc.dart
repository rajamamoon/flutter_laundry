import 'package:bloc/bloc.dart';
import 'package:whitedrywash/service/viewmodel/api_provider.dart';
import 'wash_delivery_address_event.dart';
import 'wash_delivery_address_state.dart';

class WashDeliveryAddressBloc extends Bloc<WashDeliveryAddressEvent, WashDeliveryAddressState> {
  final ApiProvider apiProvider = ApiProvider();

  void mobileInput(mobile) {
    add(MobileInput(mobile: mobile));
  }

  void nameInput(name) {
    add(NameInput(name: name));
  }

  void washShopPayInput(washShopPay) {
    add(WashShopPayInput(washShopPay: washShopPay));
  }

  void addressInput(address) {
    add(AddressInput(address: address));
  }

  void washTypeInput(washType) {
    add(WashTypeInput(washTypeInput: washType));
  }

  @override
  WashDeliveryAddressState get initialState => WashDeliveryAddressState.initial();

  @override
  Stream<WashDeliveryAddressState> mapEventToState(WashDeliveryAddressEvent event) async* {

    if (event is WashShopPayInput) {
      yield state.copyWith(washShopPay: event.washShopPay);
    }

    if (event is WashTypeInput) {
      yield state.copyWith(mobile: event.washTypeInput);
    }

    if (event is MobileInput) {
      yield state.copyWith(mobile: event.mobile);
    }

    if (event is NameInput) {
      yield state.copyWith(name: event.name);
    }

    if (event is AddressInput) {
      yield state.copyWith(address: event.address);
    }

    if (event is WashTypeInput) {
      yield state.copyWith(washType: event.washTypeInput);
    }
  }
}

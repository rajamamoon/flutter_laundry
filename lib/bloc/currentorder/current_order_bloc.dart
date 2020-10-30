import 'package:bloc/bloc.dart';
import 'package:whitedrywash/service/viewmodel/api_provider.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'current_order_event.dart';
import 'current_order_state.dart';

class CurrentOrderBloc extends Bloc<CurrentOrderEvent, CurrentOrderState> {
  final ApiProvider apiProvider = ApiProvider();

  void userIdParam(userIdParam) {
    add(UserIdParam(userIdParam: userIdParam));
    add(CurrentOrder());
  }

  @override
  CurrentOrderState get initialState => CurrentOrderState.initial();

  @override
  Stream<CurrentOrderState> mapEventToState(CurrentOrderEvent event) async* {
    if (event is CurrentOrder) {
      yield state.copyWith(currentOrderList: List(), loading: true);
      await apiProvider.getCurrentOrderList(state.userId);

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          yield state.copyWith(loading: false, currentOrderList: response);
        } else {
          yield state.copyWith(
              loading: false, errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loading: false, errorMessage: e.toString());
        event.callback('Error, Something bad happened.');
      }
    }
  }
}

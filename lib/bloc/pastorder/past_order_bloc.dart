import 'package:bloc/bloc.dart';
import 'package:whitedrywash/service/viewmodel/api_provider.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'past_order_event.dart';
import 'past_order_state.dart';

class PastOrderBloc extends Bloc<PastOrderEvent, PastOrderState> {
  final ApiProvider apiProvider = ApiProvider();

  void userIdParam(userIdParam) {
    add(UserIdParam(userIdParam: userIdParam));
    add(PastOrder());
  }

  @override
  PastOrderState get initialState => PastOrderState.initial();

  @override
  Stream<PastOrderState> mapEventToState(PastOrderEvent event) async* {
    if (event is PastOrder) {
      yield state.copyWith(pastOrderList: List(), loading: true);
      await apiProvider.getPastOrderList(state.userId);

      try {
        if (apiProvider.apiResult.responseCode == ok200) {
          var response = apiProvider.apiResult.response;
          yield state.copyWith(loading: false, pastOrderList: response);
        } else {
          yield state.copyWith(loading: false, errorMessage: apiProvider.apiResult.errorMessage);
        }
      } catch (e) {
        yield state.copyWith(loading: false, errorMessage: e.toString());
        event.callback('Error, Something bad happened.');
      }
    }
  }
}

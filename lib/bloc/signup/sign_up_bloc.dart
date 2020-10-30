import 'package:bloc/bloc.dart';
import 'package:whitedrywash/service/viewmodel/api_provider.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ApiProvider apiProvider = ApiProvider();

  void nameInput(name) {
    add(NameInput(name: name));
  }

  void mobileInput(mobile) {
    add(MobileInput(mobile: mobile));
  }

  void passwordInput(password) {
    add(PasswordInput(password: password));
  }

  void confirmPasswordInput(confirmPasswordInput) {
    add(ConfirmPasswordInput(confirmPasswordInput: confirmPasswordInput));
  }

  void signUp(callback) {
    add(SignUp(callback: callback));
  }

  @override
  SignUpState get initialState => SignUpState.initial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is NameInput) {
      yield state.copyWith(name: event.name);
    }

    if (event is MobileInput) {
      yield state.copyWith(mobile: event.mobile);
    }

    if (event is PasswordInput) {
      yield state.copyWith(password: event.password);
    }

    if (event is ConfirmPasswordInput) {
      yield state.copyWith(confirmPassword: event.confirmPasswordInput);
    }

    if (event is SignUp) {

    }
  }
}

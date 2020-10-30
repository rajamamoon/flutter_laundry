import 'package:meta/meta.dart';

class SignUpState {
  final String name;
  final String mobile;
  final String password;
  final String confirmPassword;
  bool loading;

  SignUpState({
    @required this.name,
    @required this.mobile,
    @required this.password,
    @required this.confirmPassword,
    bool loading,
  });

  factory SignUpState.initial() {
    return SignUpState(
      loading: false,
      name: null,
      mobile: null,
      password: null,
      confirmPassword: null,
    );
  }

  SignUpState copyWith(
      {bool loading, Map error, String name, String mobile, String password, String confirmPassword}) {
    return SignUpState(
      loading: loading ?? this.loading,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

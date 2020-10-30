abstract class CurrentOrderEvent {
}

class UserIdParam extends CurrentOrderEvent {
  final String userIdParam;
  UserIdParam({this.userIdParam});
}

class CurrentOrder extends CurrentOrderEvent {
  Function callback;
  CurrentOrder({this.callback});
}

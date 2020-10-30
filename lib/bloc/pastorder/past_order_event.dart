abstract class PastOrderEvent {
}

class UserIdParam extends PastOrderEvent {
  final String userIdParam;
  UserIdParam({this.userIdParam});
}

class PastOrder extends PastOrderEvent {
  Function callback;
  PastOrder({this.callback});
}

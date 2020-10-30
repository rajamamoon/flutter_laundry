abstract class DryWashEvent {
}

class DryWash extends DryWashEvent {
  Function callback;
  DryWash({this.callback});
}

class SelectCloth extends DryWashEvent {
  Function callback;
  SelectCloth({this.callback});
}

class WashItem extends DryWashEvent {
  Function callback;
  WashItem({this.callback});
}

class WashItemQuantity extends DryWashEvent {
}

class WashItemDelete extends DryWashEvent {
}

class WashItemWashWater extends DryWashEvent {
}

class DryWashSelect extends DryWashEvent {
  Function callback;
  DryWashSelect({this.callback});
}

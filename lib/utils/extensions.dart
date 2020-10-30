import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'vars.dart';

extension ContextExtensions on BuildContext {
  double widthInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(context).size.width * toDouble;
  }

  double heightInPercent(BuildContext context, double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(context).size.height * toDouble;
  }


  showProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Container(
          alignment: FractionalOffset.center,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
        ));
  }

  hideProgress(BuildContext context) {
    Navigator.pop(context);
  }
}

extension WidgetExtensions on Widget {
  padding(EdgeInsets edgeInsets) => Padding(padding: edgeInsets, child: this);

  cardView(EdgeInsets margin, EdgeInsets padding) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // has the effect of softening the shadow
            spreadRadius: 0.5, // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: this,
      margin: margin,
      padding: padding);

  marginVisible({EdgeInsets edgeInsets, bool isVisible = true}) => Visibility(
        visible: isVisible,
        child: Container(
            margin: (edgeInsets == null) ? EdgeInsets.all(0) : edgeInsets,
            child: this),
      );

  inputField(TextEditingController textEditingController, { ValueChanged<String> onChanged, int maxLength, TextInputType keyboardType, String hintText,  String labelText, bool obscureText = false, InkWell inkWell,  FormFieldValidator<String> validation}) =>  TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged:onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffix: inkWell),
      validator: validation);

  customFloatForm({IconData icon, VoidCallback qrCallback, bool isMini = false}) => FloatingActionButton(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
          decoration:  BoxDecoration(
              gradient:  LinearGradient(colors: gradientsButton)),
          child: Stack(fit: StackFit.expand, children: <Widget>[
            Icon(
                icon,
                size: 30,
                color: Colors.blue
            )
          ])));

  expandStyle(int flex, Widget child) => Expanded(flex: flex, child: child);


}

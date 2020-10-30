import 'package:flutter/material.dart';
import 'package:whitedrywash/ui/cliper/arc_clipper.dart';
import 'package:whitedrywash/utils/vars.dart';

class LoginBackground extends StatelessWidget {
  final showIcon;
  final image;

  LoginBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    return new Flexible(
        flex: 1,
        child: ClipPath(
            clipper: new ArcClipper(),
            child: Stack(children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                  colors: kitGradients,
                )),
              ),
              showIcon
                  ? new Center(
                      child: Text('Contact Us',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: quickFont,
                              color: Colors.blue)),
                    )
                  : new Container()
            ])));
  }

  final bottomHalf = new Flexible(
    flex: 5,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}

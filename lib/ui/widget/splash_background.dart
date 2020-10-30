import 'package:flutter/material.dart';
import 'package:whitedrywash/ui/cliper/splash_clipper.dart';
import 'package:whitedrywash/utils/vars.dart';

class SplashBackground extends StatelessWidget {
  final showIcon;
  final image;

  SplashBackground({this.showIcon = true, this.image});

   topHalf(BuildContext context) =>
      Flexible(
        flex: 2,
        child: ClipPath(
            clipper: SplashClipper(),
            child: Stack(children: <Widget>[
               Container(color: Colors.blue,),
              showIcon
                  ?  Center(
                      child: Text(companyName,
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: quickFont,
                              color: Colors.white)),
                    )
                  :  Container()
            ])));


  final bottomHalf =  Flexible(
    flex: 3,
    child:  Container(),
  );

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
}

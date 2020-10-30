import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/ui/widget/splash_background.dart';
import 'package:whitedrywash/utils/vars.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Duration five;
  Timer t2;
  String routeName;

  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();

    five = const Duration(seconds: 3);
    t2 = new Timer(five, () => _loginGo());
  }

  _loginGo() {
    _userBloc.state.isLogin == true
        ? Navigator.pushReplacementNamed(context, tabRoute)
        : Navigator.pushReplacementNamed(context, loginRoute);
  }

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    t2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        SplashBackground(
          showIcon: true,
        )
      ]),
      bottomNavigationBar: new Container(
          width: MediaQuery.of(context).size.width, child: appLaunchDetail()),
    );
  }

  appLaunchDetail() => Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text('18-Jan-2019',
                style: TextStyle(
                    fontFamily: quickFont,
                    color: Colors.black45,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold)),
          ]));
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/utils/vars.dart';

class ProfilePage extends StatefulWidget {
  @override
  createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(children: <Widget>[
      ClipPath(
        child: Container(color: Colors.blue),
        clipper: getClipper(),
      ),
      SafeArea(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                        child: Material(
                            color: Colors.transparent, // button color
                            child: InkWell(
                                child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child:
                                    Icon(Icons.arrow_back, color: Colors.white)),
                                onTap: () => Navigator.pop(context)))),
                    ClipOval(
                        child: Material(
                            color: Colors.transparent, // button color
                            child: InkWell(
                                child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child:
                                        Icon(Icons.edit, color: Colors.white)),
                                onTap: () => Navigator.pushNamed(
                                    context, profileEditRoute))))
                  ]))),
      Positioned(
          width: MediaQuery.of(context).size.width / 1,
          top: MediaQuery.of(context).size.height / 3.5,
          child: Column(children: <Widget>[
            Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    image: DecorationImage(
                        image: ExactAssetImage(profileImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7.2,
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0.2)
                    ])),
            SizedBox(height: 15.0),
            Text(_userBloc.state.userName,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                )),
            SizedBox(height: 15.0),
            ListTile(
                leading: Icon(Icons.phone),
                title: Text('Mobile', style: TextStyle(color: Colors.black)),
                subtitle: Text(_userBloc.state.mobile)),
            ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address', style: TextStyle(color: Colors.black)),
                subtitle: Text(_userBloc.state.address == "" ? '': _userBloc.state.address))
          ]))
    ]));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2.2);
    path.lineTo(size.width + 450, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

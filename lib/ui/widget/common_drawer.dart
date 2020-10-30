import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/bloc/user/user_state.dart';
import 'package:whitedrywash/ui/cliper/drawer_cliper.dart';
import 'package:whitedrywash/utils/vars.dart';

class CommonDrawer extends StatefulWidget {
  @override
  CommonDrawerState createState() => CommonDrawerState();
}

class CommonDrawerState extends State<CommonDrawer> {
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();
  }

  @override
  Widget build(BuildContext context) =>
      Stack(overflow: Overflow.visible, children: <Widget>[
        ClipPath(
            clipper: CustomDrawerClipper(),
            child: Material(
                child: Stack(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                    BlocBuilder(
                        bloc: _userBloc,
                        builder: (context, UserState userState) =>
                            UserAccountsDrawerHeader(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                ),
                                accountName: Row(children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  SizedBox(width: 3),
                                  Text(userState.userName.toLowerCase(),
                                      style: TextStyle(
                                          fontFamily: quickFont,
                                          fontSize: 15.0,
                                          color: Colors.black))
                                ]),
                                accountEmail: Row(children: <Widget>[
                                  Icon(Icons.phone_android,
                                      color: Colors.grey, size: 20),
                                  SizedBox(width: 3),
                                  Text(userState.mobile,
                                      style: TextStyle(
                                          fontFamily: quickFont,
                                          fontSize: 14.0,
                                          color: Colors.black))
                                ]),
                                currentAccountPicture: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        userState.profilePicture.isEmpty
                                            ? ExactAssetImage(profileImage)
                                            : NetworkImage(
                                                userState.profilePicture)))),
                    CustomListView(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        name: drawerHome,
                        leading: Icon(Icons.home, color: Colors.blue)),
                    CustomListView(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, profileRoute);
                        },
                        name: drawerProfile,
                        leading: Icon(Icons.person, color: Colors.green)),
                    CustomListView(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, dashboardRoute);
                        },
                        name: drawerDashboard,
                        leading: Icon(Icons.dashboard, color: Colors.brown)),
                    CustomListView(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, contactRoute);
                        },
                        name: drawerContactUs,
                        leading: Icon(Icons.contacts, color: Colors.cyan)),
                    Divider(color: Colors.orangeAccent),
                    CustomListView(
                        onPressed: () {
                          _userBloc.saveUserName('');
                          _userBloc.saveUserId('');
                          _userBloc.saveMobile('');
                          _userBloc.saveEmail('');
                          _userBloc.saveProfilePicture('');
                          _userBloc.saveIsLogin(false);

                          Navigator.of(context)
                            .pushNamedAndRemoveUntil(
                                loginRoute, (Route<dynamic> route) => false);
                        },
                        name: drawerLogout,
                        leading: Icon(Icons.vpn_key, color: Colors.red)),
                    Divider(color: Colors.orangeAccent),
                  ]))
            ]))),
        FractionalTranslation(
            translation: Offset(-0.24, 0.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                        elevation: 9.0,
                        type: MaterialType.circle,
                        color: Colors.transparent,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30.0,
                        )))))
      ]);
}

class CustomListView extends StatelessWidget {
  CustomListView(
      {@required this.onPressed, @required this.name, @required this.leading});

  final GestureTapCallback onPressed;
  final String name;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          name,
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w300,
              fontFamily: quickFont,
              fontSize: 16.0),
        ),
        leading: leading,
        onTap: onPressed);
  }
}

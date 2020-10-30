import 'package:flutter/material.dart';
import 'package:whitedrywash/ui/page/order_search_page.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'common_drawer.dart';

class CommonScaffold extends StatelessWidget {
  final appTitle;
  final showAppBar;
  final Widget bodyData;
  final showDrawer;
  final backGroundColor;
  final actionFirstIcon;
  final scaffoldKey;
  final Widget bottomData;
  final bool showBottom;
  final elevation;

  CommonScaffold(
      {this.appTitle,
      this.bodyData,
      this.showDrawer = false,
      this.backGroundColor,
      this.actionFirstIcon = Icons.refresh,
      this.scaffoldKey,
      this.bottomData,
      this.showAppBar = true,
      this.showBottom = false,
      this.elevation = 0.5});

  @override
  Widget build(BuildContext context) => Scaffold(
      key: scaffoldKey != null ? scaffoldKey : null,
      backgroundColor: backGroundColor != null ? backGroundColor : null,
      appBar: showAppBar
          ? AppBar(
              brightness: Brightness.light,
              leading: showDrawer
                  ? GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState.openDrawer();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: Icon(Icons.menu, color: Colors.black),
                      ))
                  : null,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: elevation,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              backgroundColor: Colors.white,
              title: Text(appTitle,
                  style: TextStyle(
                      fontFamily: quickFont,
                      fontSize: 18.0,
                      color: Colors.black)),
              /*actions: _buildAppActions(),*/
              actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: OrderSearchPage());
                    },
                    icon: Icon(actionFirstIcon, color: Colors.black),
                  )
                ])
          : null,
      drawer: showDrawer ? CommonDrawer() : null,
      body: bodyData,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: showBottom ? bottomData : null);
}

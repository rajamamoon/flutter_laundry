import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/selectwashshop/select_wash_shop_bloc.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'order_current.dart';
import 'order_past.dart';

class TabOrderPage extends StatefulWidget {
  @override
  createState() => _TabOrderState();
}

class _TabOrderState extends State<TabOrderPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextStyle tabStyle = TextStyle(fontSize: 14, fontFamily: quickFont);
  SelectWashShopBloc _selectWashShopBloc;

  @override
  void initState() {
    super.initState();

    _selectWashShopBloc = BlocProvider.of<SelectWashShopBloc>(context);
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) => _scaffold();

  _scaffold() => CommonScaffold(
      bodyData: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1.0, color: Colors.black),
                      insets: EdgeInsets.symmetric(horizontal: 20.0)),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black.withOpacity(0.6),
                  controller: tabController,
                  tabs: [
                    _tabName(tabCurrentOrder),
                    _tabName(tabPastOrder),
                  ]),
              body: TabBarView(
                  controller: tabController,
                  children: [OrderCurrentPage(), OrderPastPage()]))),
      showDrawer: true,
      appTitle: appName,
      showAppBar: true,
      bottomData: BottomAppBar(
          elevation: 0.0,
          child: GestureDetector(
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade100, Colors.white],
                        begin: Alignment.centerRight,
                        end: Alignment(0.0, 0.0),
                        tileMode: TileMode.clamp),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('DRY WASH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: quickFont,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16))),
              onTap: () {
                _selectWashShopBloc.clearWashShopDetail();
                  Navigator.pushNamed(context, dryWashRoute); })),
      showBottom: true,
      scaffoldKey: _scaffoldKey,
      actionFirstIcon: Icons.search);

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  _tabName(String name) => Tab(
          child: Text(
        name,
        style: tabStyle,
      ));
}

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  DecoratedTabBar({@required this.tabBar, @required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(child: Container(decoration: decoration)),
      tabBar
    ]);
  }
}

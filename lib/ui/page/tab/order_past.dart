import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/pastorder/past_order_bloc.dart';
import 'package:whitedrywash/bloc/pastorder/past_order_state.dart';
import 'package:whitedrywash/model/order/past_order_response.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'order_row.dart';

class OrderPastPage extends StatefulWidget {
  @override
  createState() => _OrderPastState();
}

class _OrderPastState extends State<OrderPastPage> {
  PastOrderBloc _pastOrderBloc;

  @override
  void initState() {
    super.initState();

    _pastOrderBloc = BlocProvider.of<PastOrderBloc>(context);
    _pastOrderBloc.userIdParam('1');
  }

  _bodyData() => BlocBuilder(
      bloc: _pastOrderBloc,
      builder: (context, PastOrderState snapshot) => snapshot.loading
          ? Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
      )
          : _bodyList(snapshot.pastOrderList));

  _bodyList(List<PastOrderResponse> pastOrderList) => ListView.builder(
      itemCount: pastOrderList.length,
      itemBuilder: (context, position) => Card(
          color: Theme.of(context).cardColor,
          //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
          ),
          child: Container(
              child: Column(children: <Widget>[
            OrderRow(pastOrderList[position].orderId, pastOrderList[position].shopName, pastOrderList[position].shopAddress, pastOrderList[position].shopMobileNo,
                pastOrderList[position].deliveryAddress,  pastOrderList[position].deliveryDate, '0', pastOrderList[position].orderDate, pastOrderList[position].orderStatus,
                payAmount: pastOrderList[position].orderAmount,  orderType: pastOrderList[position].orderType)
          ]))));

  @override
  Widget build(BuildContext context) => Scaffold(body: _bodyData());

  @override
  void dispose() {
    if (this.mounted) super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}

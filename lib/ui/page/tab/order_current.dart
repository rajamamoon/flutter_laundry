import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/currentorder/current_order_bloc.dart';
import 'package:whitedrywash/bloc/currentorder/current_order_state.dart';
import 'package:whitedrywash/model/order/current_order_response.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'order_row.dart';

class OrderCurrentPage extends StatefulWidget {
  @override
  createState() => _OrderCurrentState();
}

class _OrderCurrentState extends State<OrderCurrentPage> {
  CurrentOrderBloc _currentOrderBloc;

  @override
  void initState() {
    super.initState();

    _currentOrderBloc = BlocProvider.of<CurrentOrderBloc>(context);
    _currentOrderBloc.userIdParam('1');
  }

  _bodyData() => BlocBuilder(
      bloc: _currentOrderBloc,
      builder: (context, CurrentOrderState snapshot) => snapshot.loading
          ? Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
      )
          : _bodyList(snapshot.currentOrderList));

  _bodyList(List<CurrentOrderResponse> currentOrderList) => ListView.builder(
      itemCount: currentOrderList.length,
      itemBuilder: (context, position) => Card(
          color: Theme.of(context).cardColor,
          //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
          ),
          child: Container(
              child: Column(children: <Widget>[
            OrderRow(currentOrderList[position].orderId, currentOrderList[position].shopName, currentOrderList[position].shopAddress, currentOrderList[position].shopMobileNo,
                currentOrderList[position].deliveryAddress,  currentOrderList[position].deliveryDate, currentOrderList[position].orderAmount, currentOrderList[position].orderDate, currentOrderList[position].orderStatus,
                payAmount: currentOrderList[position].payAmount,  orderType: currentOrderList[position].orderType)
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

import 'package:flutter/material.dart';
import 'package:whitedrywash/utils/vars.dart';

class OrderRow extends StatelessWidget {
  final String orderNo;
  final String payAmount;
  final String shopName;
  final String shopAddress;
  final String shopMobile;
  final String deliveryAddress;
  final String completeDateTime;
  final String orderType;
  final String orderAmount;
  final String orderDateTime;
  final String orderStatus;

  OrderRow(
      this.orderNo,
      this.shopName,
      this.shopAddress,
      this.shopMobile,
      this.deliveryAddress,
      this.completeDateTime,
      this.orderAmount,
      this.orderDateTime,
      this.orderStatus,
      {this.payAmount = "",
      this.orderType = ""});

  @override
  Widget build(BuildContext context) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: nameCallMap(shopName, shopMobile, deliveryAddress),
        ),
        Expanded(
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            expandStyle(3, widgetOrderId(orderNo)),
                            expandStyle(2, widgetPayAmount(payAmount, orderStatus)),
                            expandStyle(2, widgetCompleteDateTime(completeDateTime)),
                          ]),
                      widgetShopName(shopName),
                      widgetShopAddress(shopAddress),
                      SizedBox(height: 1),
                      widgetShopMobile(shopMobile),
                      SizedBox(height: 1),
                      widgetDeliveryAddress(deliveryAddress),
                      SizedBox(height: 1),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            expandStyle(3, widgetDeliveryType(orderType)),
                            expandStyle(2, Column(children: <Widget>[widgetOrderAmount(orderAmount)])),
                            expandStyle(2, widgetOrderDateTime(orderDateTime)),
                          ]),
                    ])))
      ]);
}

//TODO PICK UP DETAIL WIDGETS
nameCallMap(String shopName, String mobile, String address) =>
    Column(children: [
      GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 18.0,
            child: Text(
              shopName.substring(0, 1),
              style: TextStyle(
                  fontFamily: quickFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: colorRoundText),
            ),
            backgroundColor: colorRoundTextBg,
          )),
      GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 19.0,
            child: Icon(Icons.phone, color: colorIconCall),
            backgroundColor: Colors.transparent,
          )),
      GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 19.0,
            child: Icon(Icons.map, color: colorIconMap),
            backgroundColor: Colors.transparent,
          ))
    ]);

widgetOrderId(String orderId) => Column(children: [
      Text(
        orderId.contains(".") ? orderId.split(".")[0] : orderId,
        style: TextStyle(
            fontFamily: ralewayFont,
            fontWeight: FontWeight.w300,
            fontSize: 15.0,
            color: colorOrderId),
      ),
      Container(
        color: colorOrderId,
        width: orderId.length <= 3 ? 7.0 * orderId.length : 21.0,
        height: 1.5,
      )
    ], crossAxisAlignment: CrossAxisAlignment.start);

widgetCompleteDateTime(String dateTime) => Text(dateTime,
    textAlign: TextAlign.right,
    style: TextStyle(
        fontFamily: ralewayFont,
        fontWeight: FontWeight.w600,
        fontSize: 10.0,
        color: colorOrderCompleteDateTime));

widgetOrderDateTime(String dateTime) => Text(dateTime,
    textAlign: TextAlign.right,
    style: TextStyle(
        fontFamily: ralewayFont,
        fontWeight: FontWeight.w600,
        fontSize: 10.0,
        color: colorOrderAmount));

widgetPayAmount(String payAmount, String orderStatus) => Column(children: <Widget>[
  Text(
    symbolRs + double.parse(payAmount).toStringAsFixed(2),
    textAlign: TextAlign.right,
    style: TextStyle(
        fontFamily: ralewayFont,
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        color: colorOrderPayAmount),
  ),
  Text(
    orderStatus,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: quickFont,
        fontWeight: FontWeight.w700,
        fontSize: 11.0,
        color: Colors.black),
  )
]);

widgetOrderAmount(String payAmount) => Text(
      payAmount.toString().isEmpty
          ? ''
          : symbolRs + double.parse(payAmount).toStringAsFixed(2),
      textAlign: TextAlign.right,
      style: TextStyle(
          fontFamily: ralewayFont,
          fontWeight: FontWeight.w600,
          fontSize: 13.0,
          color: colorOrderAmount),
    );

widgetShopName(String shopName) => Container(
    margin: EdgeInsetsDirectional.only(top: 4.0),
    child: Text(
      shopName,
      style: TextStyle(
          fontFamily: quickFont,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: colorName),
    ));

widgetShopAddress(String shopAddress) => Text(
      shopAddress,
      style: TextStyle(
          fontFamily: quickFont, fontSize: 13.0, color: colorShopAddress),
    );

widgetShopMobile(String mobile) => Text(
      mobile,
      style:
          TextStyle(fontFamily: quickFont, fontSize: 14.0, color: colorMobile),
    );

widgetDeliveryAddress(String address) => Padding(
    padding: const EdgeInsets.only(top: 3.0),
    child: Text(
      address,
      style: TextStyle(
          fontFamily: quickFont,
          letterSpacing: 0.5,
          fontSize: 14.0,
          color: colorDeliveryAddress),
    ));

widgetDeliveryType(String deliveryType) => deliveryType.isEmpty
    ? Container()
    : Text(deliveryType,
        style: TextStyle(
            fontFamily: quickFont, fontSize: 14.0, color: Colors.black));

//TODO PICKUP BUTTON WIDGETS
buttonTextStyle(String btnName) =>
    Text(btnName, style: TextStyle(fontFamily: quickFont, fontSize: 12.0));

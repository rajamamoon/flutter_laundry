import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:whitedrywash/bloc/selectwashshop/select_wash_shop_bloc.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/bloc/washdeliveryaddress/wash_delivery_address_bloc.dart';
import 'package:whitedrywash/model/orderjson/order_json.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/utils/vars.dart';

class QRCodePage extends StatefulWidget {
  @override
  createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCodePage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  SelectWashShopBloc _selectWashShopBloc;
  WashDeliveryAddressBloc _washDeliveryAddressBloc;
  UserBloc _userBloc;
  OrderJson orderJson;
  @override
  void initState() {
    super.initState();

    _selectWashShopBloc = BlocProvider.of<SelectWashShopBloc>(context);
    _washDeliveryAddressBloc =
        BlocProvider.of<WashDeliveryAddressBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();

    orderJson = new OrderJson(
        _userBloc.state.userId,
        _selectWashShopBloc.state.washShopId.toString(),
        _washDeliveryAddressBloc.state.washShopPay,
        _selectWashShopBloc.state.washTotal.toString(),
        '',
        _washDeliveryAddressBloc.state.name,
        _washDeliveryAddressBloc.state.mobile,
        _washDeliveryAddressBloc.state.address,
        'Normal');

    print('Tag' + orderJson.toJson().toString());
  }

  bodyData() => SafeArea(
          child: ListView(children: <Widget>[
        Card(
            child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text(_selectWashShopBloc.state.washShopName,
                    style: TextStyle(fontSize: 18)),
                subtitle: Text(_selectWashShopBloc.state.washShopAddress,
                    style: TextStyle(fontSize: 15)))),
        SizedBox(height: 5),
        Card(
            child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text(_washDeliveryAddressBloc.state.name,
                    style: TextStyle(fontSize: 18)),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_washDeliveryAddressBloc.state.mobile,
                          style:
                              TextStyle(fontSize: 15, color: Colors.blueGrey)),
                      Text(_washDeliveryAddressBloc.state.address,
                          style: TextStyle(fontSize: 15)),
                      Text(
                          'WASH TYPE - ' +
                              _washDeliveryAddressBloc.state.washType
                                  .toUpperCase(),
                          style:
                          TextStyle(fontSize: 15, color: Colors.black54)),
                      SizedBox(height: 10),
                      Text(
                          'YOU PAY TOTAL AMOUNT: ' +
                              _washDeliveryAddressBloc.state.washShopPay,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ]),
                trailing: Text(
                    symbolRs + _selectWashShopBloc.state.washTotal.toString(),
                    style: TextStyle(color: Colors.blueAccent)))),
      ]));

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  _scaffold() => CommonScaffold(
      actionFirstIcon: null,
      showAppBar: true,
      appTitle: titleScanQRCode,
      showBottom: true,
      bottomData: Container(
          padding: EdgeInsets.all(10),
          child: Stack(alignment: Alignment(0, 0), children: <Widget>[
            Container(
                width: 198,
                height: 198,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.0, 1],
                        colors: [Colors.grey.withOpacity(0.1), Colors.white]))),
            Container(
                width: 189,
                height: 189,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white)),
            QrImage(
              data: orderJson.toJson().toString(),
              version: QrVersions.auto,
              size: 198,
              gapless: false
            ),
            Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white)),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      tabRoute, (Route<dynamic> route) => false);
                },
                child: Container(
                    width: 53,
                    height: 53,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [
                              0.0,
                              1
                            ],
                            colors: [
                              Colors.grey,
                              Colors.blue.withOpacity(0.1)
                            ])),
                    child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.grey.shade100,
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                ExactAssetImage(whiteDryWashImage)))))
          ])),
      scaffoldKey: _scaffoldState,
      bodyData: bodyData());
}

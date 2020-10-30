import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/drywash/dry_wash_bloc.dart';
import 'package:whitedrywash/bloc/selectwashshop/select_wash_shop_bloc.dart';
import 'package:whitedrywash/bloc/selectwashshop/select_wash_shop_state.dart';
import 'package:whitedrywash/model/selectwashshop/select_wash_shop_response.dart';
import 'package:whitedrywash/model/selectwashshop/wash_item_return_master.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/utils/vars.dart';

class SelectWashShopPage extends StatefulWidget {
  @override
  createState() => _SelectWashShopState();
}

class _SelectWashShopState extends State<SelectWashShopPage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  DryWashBloc _dryWashBloc;
  SelectWashShopBloc _selectWashShopBloc;

  @override
  void initState() {
    super.initState();

    _dryWashBloc = BlocProvider.of<DryWashBloc>(context);
    _selectWashShopBloc = BlocProvider.of<SelectWashShopBloc>(context);

    _dryWashBloc.washItem();
    _selectWashShopBloc.washItem(_dryWashBloc.state.dryWashItemList);
    _selectWashShopBloc.selectWashShopItem();
  }

  _bodyData() => Column(children: <Widget>[
        BlocBuilder(
            bloc: _selectWashShopBloc,
            builder: (context, SelectWashShopState snapshot) {
              return snapshot.loadingSelect
                  ? Container(
                      height: 2,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    )
                  : Container();
            }),
        Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
              Widget>[
            BlocBuilder(
                bloc: _selectWashShopBloc,
                builder: (context, SelectWashShopState snapshot) => FlatButton(
                    color: Colors.blue,
                    child: Text(labelCity,
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                    onPressed: () => _selectWashShopBloc.state.loadingSelect
                        ? null
                        : _cityToApi())),
            BlocBuilder(
                bloc: _selectWashShopBloc,
                builder: (context, SelectWashShopState snapshot) => FlatButton(
                    color: Colors.blue,
                    child: Text(labelArea,
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                    onPressed: () => _selectWashShopBloc.state.loadingSelect
                        ? null
                        : _areaToApi())),
            BlocBuilder(
                bloc: _selectWashShopBloc,
                builder: (context, SelectWashShopState snapshot) => FlatButton(
                    color: Colors.blue,
                    child: Text(labelWashShop,
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                    onPressed: () => _selectWashShopBloc.state.loading
                        ? null
                        : _washShopToApi()))
          ]),
          BlocBuilder(
              bloc: _selectWashShopBloc,
              builder: (context, SelectWashShopState snapshot) =>
                  _selectWashShopBloc.state.washShopId == 0
                      ? Container()
                      : ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(_selectWashShopBloc.state.washShopName),
                          subtitle: Text(
                              _selectWashShopBloc.state.washShopAddress,
                              style: TextStyle(fontSize: 13)),
                          trailing: Text(
                              symbolRs +
                                  _selectWashShopBloc.state.washTotal
                                      .toString(),
                              style: TextStyle(color: Colors.blueAccent))))
        ]),
        BlocBuilder(
            bloc: _selectWashShopBloc,
            builder: (context, SelectWashShopState snapshot) => snapshot.loading
                ? Container()
                : _bodyList(snapshot.washItemReturnMasterList))
      ]);

  _bodyList(List<WashItemReturnMaster> washItemReturnMasterList) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: washItemReturnMasterList.length,
          itemBuilder: (context, position) => Card(
              elevation: 0,
              child: Container(
                  padding:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text(
                              washItemReturnMasterList[position]
                                  .selectWashMaster
                                  .categoryName,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Text(
                              washItemReturnMasterList[position]
                                      .selectWashMaster
                                      .washShopStatus
                                  ? ''
                                  : '(NOT WASHING)',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: <Widget>[
                          expandStyle(
                              2,
                              Row(children: <Widget>[
                                Text(
                                    washItemReturnMasterList[position].washWater
                                        ? 'HOT CHARGE ' +
                                            symbolRs +
                                            ' ' +
                                            (washItemReturnMasterList[position]
                                                        .selectWashMaster
                                                        .water *
                                                    washItemReturnMasterList[
                                                            position]
                                                        .quantity)
                                                .toString()
                                        : 'NORMAL',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black54))
                              ])),
                          expandStyle(
                              1,
                              Text(
                                  washItemReturnMasterList[position]
                                      .quantity
                                      .toString(),
                                  style: TextStyle(color: Colors.black45))),
                          expandStyle(
                              1,
                              Text(
                                  washItemReturnMasterList[position]
                                      .selectWashMaster
                                      .price
                                      .toString(),
                                  style: TextStyle(color: Colors.black45))),
                          expandStyle(
                              1,
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                        symbolRs + ' ' +
                                            washItemReturnMasterList[position]
                                                .totalPrice
                                                .toString(),
                                        style: TextStyle(color: Colors.grey))
                                  ])),
                        ])
                      ]))));

  _cityToApi() async {
    _selectWashShopBloc.city((results) {
      cityBottomSheetDialog(results);
    });
  }

  _areaToApi() async {
    _selectWashShopBloc.area((results) {
      List<String> areaList = results;
      areaList.isEmpty
          ? print('Area is empty')
          : areaBottomSheetDialog(results);
    });
  }

  _washShopToApi() async {
    _selectWashShopBloc.selectWashShop((results) {
      List<SelectWashShopResponse> washShopList = results;
      washShopList.isEmpty
          ? print('Wash Shop not availble area')
          : washShopBottomSheetDialog(washShopList);
    });
  }

  cityBottomSheetDialog(List<String> cityList) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: cityList.length,
                itemBuilder: (BuildContext context, int position) => InkWell(
                    onTap: () {
                      _selectWashShopBloc.cityName(cityList[position]);
                      _selectWashShopBloc.clearWashShopDetail();
                      Navigator.pop(context);
                    },
                    child: ListTile(title: Text(cityList[position])))));
      });

  areaBottomSheetDialog(List<String> areaList) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: areaList.length,
                itemBuilder: (BuildContext context, int position) =>
                    GestureDetector(
                        onTap: () {
                          _selectWashShopBloc.areaName(areaList[position]);
                          _selectWashShopBloc.clearWashShopDetail();
                          Navigator.pop(context);
                        },
                        child: ListTile(title: Text(areaList[position])))));
      });

  washShopBottomSheetDialog(List<SelectWashShopResponse> washShopList) =>
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
                color: Colors.white,
                child: ListView.builder(
                    itemCount: washShopList.length,
                    itemBuilder: (BuildContext context, int position) =>
                        GestureDetector(
                            onTap: () {
                              _selectWashShopBloc.washShopDetail(
                                  washShopList[position].id,
                                  washShopList[position].name,
                                  washShopList[position].address);
                              _selectWashShopBloc.selectWashShopItem();
                              Navigator.pop(context);
                            },
                            child: Card(
                                elevation: 0.2,
                                child: ListTile(
                                    subtitle: Text(
                                        washShopList[position].address,
                                        style: TextStyle(fontSize: 14)),
                                    title: Text(washShopList[position].name,
                                        style: TextStyle(fontSize: 16)))))));
          });

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  _scaffold() => CommonScaffold(
      actionFirstIcon: null,
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
                  child: Text(btnNext,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: quickFont,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16))),
              onTap: () => _selectWashShopBloc.state.washTotal > 0
                  ? Navigator.pushNamed(context, dryWashDeliveryAddressRoute)
                  : null)),
      showBottom: true,
      appTitle: titleSelectWashShop,
      scaffoldKey: _scaffoldState,
      bodyData: _bodyData());
}

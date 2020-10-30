import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/drywash/dry_wash_bloc.dart';
import 'package:whitedrywash/bloc/drywash/dry_wash_state.dart';
import 'package:whitedrywash/model/drywashitem/dry_wash_item_response.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/ui/widget/wash_manage.dart';
import 'package:whitedrywash/utils/vars.dart';

class SelectWashItemPage extends StatefulWidget {
  @override
  createState() => _SelectWashItemState();
}

class _SelectWashItemState extends State<SelectWashItemPage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  DryWashBloc _dryWashBloc;

  @override
  void initState() {
    super.initState();

    _dryWashBloc = BlocProvider.of<DryWashBloc>(context);
    _dryWashBloc.washItem();
  }

  _bodyData() => BlocBuilder(
      bloc: _dryWashBloc,
      builder: (context, DryWashState snapshot) => snapshot.loading
          ? Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
            )
          : _bodyList(snapshot.dryWashItemList));

  _bodyList(List<DryWashItemResponse> dryWashItemList) => ListView.builder(
      itemCount: dryWashItemList.length,
      itemBuilder: (context, position) => Card(
          elevation: 0,
          child: Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        dryWashItemList[position].productName +
                            ' (' +
                            dryWashItemList[position].menuName +
                            ')',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Row(children: <Widget>[
                      expandStyle(
                          2,
                          Row(children: <Widget>[
                            Checkbox(
                                value: dryWashItemList[position].washWater,
                                onChanged: (bool value) {
                                  _dryWashBloc.washItemWashWater(
                                      dryWashItemList[position].productId,
                                      value);
                                }),
                            Text('HOT')
                          ])),
                      WashManageView(
                          initialCount: dryWashItemList[position].quantity,
                          onChange: (int id) {
                            _dryWashBloc.washItemQuantity(
                                dryWashItemList[position].productId, id);
                          }),
                      expandStyle(
                          1,
                          FlatButton(
                              child: Text('DELETE',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10.0)),
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => DialogDelete(
                                      id: dryWashItemList[position].id,
                                      productName:
                                          dryWashItemList[position].productName,
                                      productId:
                                          dryWashItemList[position].productId,
                                      dryWashBloc: _dryWashBloc))))
                    ])
                  ]))));

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
              onTap: () => Navigator.pushNamed(context, selectWashShopRoute))),
      showBottom: true,
      appTitle: titleSelectWashItem,
      scaffoldKey: _scaffoldState,
      bodyData: _bodyData());
}

class DialogDelete extends StatefulWidget {
  DialogDelete(
      {Key key, this.id, this.productName, this.productId, this.dryWashBloc})
      : super(key: key);

  final int id;
  final String productName;
  final int productId;
  final DryWashBloc dryWashBloc;
  @override
  createState() => _DialogDeleteState();
}

class _DialogDeleteState extends State<DialogDelete> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Container(
            child: Stack(children: <Widget>[
          Container(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                  clipBehavior: Clip.antiAlias,
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(4.0),
                  child: ListTile(
                      subtitle: Text(widget.productName),
                      title: Text('Are you sure want to delete?')))),
          Container(
              margin: EdgeInsets.only(left: 0, top: 0, right: 10, bottom: 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.close,
                                color: Colors.black, size: 20.0),
                            onPressed: () => Navigator.pop(context)))
                  ]))
        ])),
        FloatingActionButton.extended(
            elevation: 4.0,
            backgroundColor: Colors.white,
            label: Text('DELETE',
                style: TextStyle(
                    fontFamily: quickFont,
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              widget.dryWashBloc.washItemDelete(widget.id, widget.productId);
              Navigator.pop(context);
            })
      ])));
}

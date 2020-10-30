import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/drywash/dry_wash_bloc.dart';
import 'package:whitedrywash/bloc/drywash/dry_wash_state.dart';
import 'package:whitedrywash/model/drywash/dry_wash_response.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/ui/widget/login_background.dart';
import 'package:whitedrywash/utils/vars.dart';

class DryWashPage extends StatefulWidget {
  @override
  createState() => _DryWashState();
}

class _DryWashState extends State<DryWashPage> {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  DryWashBloc _dryWashBloc;

  @override
  void initState() {
    super.initState();

    _dryWashBloc = BlocProvider.of<DryWashBloc>(context);
    _dryWashBloc.dryWash();
  }

  _bodyData() => BlocBuilder(
      bloc: _dryWashBloc,
      builder: (context, DryWashState snapshot) => snapshot.loading
          ? Container(
              alignment: FractionalOffset.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorProgressBar)),
            )
          : _bodyList(snapshot.dryWashList));

  _bodyList(List<DryWashResponse> dryWashList) =>
      Stack(fit: StackFit.expand, children: <Widget>[
        LoginBackground(showIcon: false),
        ListView(children: <Widget>[
          Column(
              children: dryWashList
                  .map((item) => item.dryWashItemList.length > 0
                      ? Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(item.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Wrap(
                              children: item.dryWashItemList
                                  .map((product) => Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ChoiceChip(
                                          onSelected: (bool selected) {
                                            _dryWashBloc.selectCloth(
                                                item.id, product.id, selected);
                                          },
                                          selected: product.isSelect,
                                          backgroundColor: Colors.white,
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(9.0),
                                              ),
                                              side: BorderSide(
                                                color: product.isSelect
                                                    ? Colors.blue
                                                    : Colors.black
                                                        .withOpacity(0.2),
                                                width: 1,
                                              )),
                                          labelStyle: TextStyle(
                                              color: product.isSelect
                                                  ? Colors.black
                                                  : Colors.black,
                                              fontSize: 13,
                                              fontWeight: product.isSelect
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                          disabledColor: Colors.white,
                                          selectedColor: Colors.white,
                                          label: Text(product.name,
                                              textAlign: TextAlign.center))))
                                  .toList()),
                          SizedBox(height: 15)
                        ])
                      : Row(children: <Widget>[]))
                  .toList())
        ])
      ]);

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
              onTap: () => _dryWashBloc.dryWashSelect((results) {
                    if (results > 0) {
                      Navigator.pushNamed(context, selectWashItemRoute);
                    }
                  }))),
      showBottom: true,
      appTitle: titleDryWash,
      scaffoldKey: _scaffoldState,
      bodyData: _bodyData());
}

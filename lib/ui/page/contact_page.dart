import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/ui/widget/login_background.dart';
import 'package:whitedrywash/utils/vars.dart';

class ContactPage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Widget bodyData() => Stack(fit: StackFit.expand, children: <Widget>[
        LoginBackground(
          showIcon: false,
        ),
        ListView.builder(
            //shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, i) {
              return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                      //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                             appName,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                           ListTile(leading: Icon(Icons.web), title: Text('Website'), subtitle: Text('Website Name')),
                            ListTile(leading: Icon(Icons.mail_outline), title: Text('Email'), subtitle: Text('Your Email')),
                            ListTile(leading: Icon(Icons.location_on), title: Text('Location'), subtitle: Text('Location'))
                          ],
                        ),
                      ),
                    ),
                  );
            })
      ]);

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  _scaffold() => CommonScaffold(
        actionFirstIcon: null,
        showAppBar: true,
        appTitle: titleContactUs,
        scaffoldKey: _scaffoldState,
        bodyData: bodyData()
      );
}

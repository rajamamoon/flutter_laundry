import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'package:whitedrywash/utils/extensions.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _mobileController = new TextEditingController();

  bool _validate = false;
  bool visible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new CommonScaffold(
      scaffoldKey: scaffoldKey,
      appTitle: titleForgotPassword,
      actionFirstIcon: null,
      bodyData: Form(key: _key, autovalidate: _validate, child: loginBody()),
    );
  }

  loginBody() => ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[forgotPasswordHeader(), formUI()]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();

    _mobileController.dispose();
  }

  forgotPasswordHeader() => Column(children: <Widget>[
        SizedBox(height: 40.0),
        _showFormIcon(),
        SizedBox(height: 10.0),
        Text(labelForgotPasswordC,
            style: TextStyle(
                fontFamily: quickFont, color: colorTitle, fontSize: 18.0)),
        SizedBox(height: 7.0),
        Text(labelForgotPasswordA,
            style: TextStyle(
                fontFamily: quickFont, color: Colors.black54, fontSize: 15.0)),
        SizedBox(height: 3.0),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
                labelForgotPasswordB,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: quickFont,
                    color: Colors.grey,
                    fontSize: 14.0))),
        SizedBox(height: 60.0)
      ]);

  formUI() => Column(children: <Widget>[
        _showMobileInput(),
        SizedBox(height: 20.0),
        _showForgotPasswordPressIcon(),
        SizedBox(height: 20.0)
      ]);

  _showMobileInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_mobileController,
          labelText: inputHintMobile,
          hintText: inputHintMobile,
          validation: validateMobile,
          keyboardType: TextInputType.phone,
          maxLength: 10));

  _showFormIcon() => Center(
      child: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.grey.shade100,
          child: CircleAvatar(
              backgroundColor:
              Colors.transparent,
              backgroundImage: ExactAssetImage(whiteDryWashImage))));

  _showForgotPasswordPressIcon() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () => _signUpValidate());

  _signUpValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}

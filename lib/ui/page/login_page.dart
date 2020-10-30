import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/login/login_bloc.dart';
import 'package:whitedrywash/bloc/login/login_state.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/model/login/login_response.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'package:whitedrywash/utils/extensions.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool _validate = false;
  bool visible = true;

  LoginBloc _loginBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      body: new Form(key: _key, autovalidate: _validate, child: loginBody()),
    );
  }

  loginBody() => ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[loginHeader(), formUI()]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();

    _mobileController.dispose();
    _passwordController.dispose();
  }

  loginHeader() => Column(children: <Widget>[
        SizedBox(height: 60.0),
        Text('${titleWelcome + ' ' + appName.toLowerCase()}',
            style: TextStyle(
                fontFamily: quickFont,
                fontWeight: FontWeight.w700,
                color: colorTitle,
                fontSize: 22.0)),
        SizedBox(height: 5.0),
        Text(
          '$titleSignInContinue',
          style: TextStyle(
              fontFamily: quickFont, color: Colors.grey, fontSize: 18.0),
        ),
        SizedBox(height: 20.0)
      ]);

  formUI() => Column(children: <Widget>[
        _showFormIcon(),
        SizedBox(height: 40.0),
        _showMobileInput(),
        _showPasswordInput(),
        SizedBox(height: 20.0),
        _showLoginPressIcon(),
        _signUp()
      ]);

  _showMobileInput() => BlocBuilder(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: widget.inputField(_mobileController,
              labelText: inputHintMobile,
              hintText: inputHintMobile,
              validation: validateMobile,
              keyboardType: TextInputType.phone,
              onChanged: _loginBloc.mobileInput,
              maxLength: 10)));

  _showPasswordInput() => BlocBuilder(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: widget.inputField(_passwordController,
              onChanged: _loginBloc.passwordInput,
              labelText: inputHintPassword,
              hintText: inputHintPassword,
              obscureText: visible,
              validation: validatePassword,
              maxLength: 10,
              inkWell: InkWell(
                  child:
                      Icon(visible ? Icons.visibility_off : Icons.visibility),
                  onTap: () {
                    setState(() {
                      visible = !visible;
                    });
                  }))));

  _showFormIcon() => Center(
      child: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.grey.shade100,
          child: CircleAvatar(
              backgroundColor:
              Colors.transparent,
              backgroundImage: ExactAssetImage(whiteDryWashImage))));

  _signUp() => Column(children: <Widget>[
        RawMaterialButton(
            child: Text(labelForgotPassword,
                style: TextStyle(
                    color: colorLink,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.pushNamed(context, forgotPasswordRoute)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('$labelDoNotAccount', style: TextStyle(color: Colors.grey)),
          RawMaterialButton(
              child: Text(labelSignUp,
                  style: TextStyle(
                      color: colorLink,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              onPressed: () => Navigator.pushNamed(context, signUpRoute))
        ])
      ]);

  _showLoginPressIcon() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () => _loginValidate());

  _loginValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _loginToApi();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  _loginToApi() async {
    FocusScope.of(context).requestFocus(FocusNode());
    context.showProgress(context);

    _loginBloc.login((results) {
      if (results is LoginResponse) {
        context.hideProgress(context);
        LoginResponse loginResponse = results;

        _userBloc.saveUserName(loginResponse.name);
        _userBloc.saveUserId(loginResponse.userId);
        _userBloc.saveMobile(loginResponse.mobile);
        _userBloc.saveEmail(loginResponse.email);
        _userBloc.saveAddress(loginResponse.address);
        _userBloc.saveProfilePicture(loginResponse.profilePicture);
        _userBloc.saveIsLogin(true);

        _userBloc.getLoginDetails();

        Navigator.pushReplacementNamed(context, tabRoute);
      } else {
        context.hideProgress(context);

        //CLEAR
        _mobileController.clear();
        _passwordController.clear();
      }
    });
  }
}

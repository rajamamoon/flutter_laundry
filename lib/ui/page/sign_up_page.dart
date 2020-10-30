import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/signup/sign_up_bloc.dart';
import 'package:whitedrywash/bloc/signup/sign_up_state.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'package:whitedrywash/utils/extensions.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();

  bool _validate = false;
  bool visible = true;

  SignUpBloc _signUpBloc;

  @override
  void initState() {
    super.initState();

    _signUpBloc = BlocProvider.of<SignUpBloc>(context);
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
      children: <Widget>[signUpHeader(), formUI()]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();

    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  signUpHeader() => Column(children: <Widget>[
        SizedBox(height: 20.0),
        Text('$titleSignUp',
            style: TextStyle(
                fontFamily: quickFont, color: colorTitle, fontSize: 18.0)),
        SizedBox(height: 20.0)
      ]);

  formUI() => Column(children: <Widget>[
        _showFormIcon(),
        SizedBox(height: 40.0),
        _showNameInput(),
        _showMobileInput(),
        _showPasswordInput(),
        _showConfirmPasswordInput(),
        SizedBox(height: 20.0),
        _showSignUpPressIcon(),
        SizedBox(height: 20.0)
      ]);

  _showNameInput() => BlocBuilder(
      bloc: _signUpBloc,
      builder: (BuildContext context, SignUpState state) =>Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_nameController,
          labelText: inputHintName,
          hintText: inputHintName,
          validation: validateName,
          onChanged: _signUpBloc.nameInput,
          keyboardType: TextInputType.text,
          maxLength: 15)));

  _showMobileInput() => BlocBuilder(
      bloc: _signUpBloc,
      builder: (BuildContext context, SignUpState state) =>Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_mobileController,
          labelText: inputHintMobile,
          hintText: inputHintMobile,
          onChanged: _signUpBloc.mobileInput,
          validation: validateMobile,
          keyboardType: TextInputType.phone,
          maxLength: 10)));

  _showPasswordInput() => BlocBuilder(
      bloc: _signUpBloc,
      builder: (BuildContext context, SignUpState state) =>Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_passwordController,
          labelText: inputHintPassword,
          hintText: inputHintPassword,
          obscureText: visible,
          onChanged: _signUpBloc.passwordInput,
          validation: validatePassword,
          maxLength: 10,
          inkWell: InkWell(
              child: Icon(visible ? Icons.visibility_off : Icons.visibility),
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              }))));

  _showConfirmPasswordInput() => BlocBuilder(
      bloc: _signUpBloc,
      builder: (BuildContext context, SignUpState state) =>Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_confirmPasswordController,
          labelText: inputHintConfirmPassword,
          onChanged: _signUpBloc.confirmPasswordInput,
          hintText: inputHintConfirmPassword,
          maxLength: 10,
          obscureText: visible, validation: (confirmation) {
        return confirmation.isEmpty
            ? 'Confirm password is required'
            : validationEqual(confirmation, _passwordController.text)
                ? null
                : 'Password and confirm password not match';
      },
          inkWell: InkWell(
              child: Icon(visible ? Icons.visibility_off : Icons.visibility),
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

  _showSignUpPressIcon() =>
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

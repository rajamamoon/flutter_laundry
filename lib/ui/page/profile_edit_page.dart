import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'package:whitedrywash/utils/extensions.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEditPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _validate = false;
  bool visible = true;

  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();

    _nameController.text = _userBloc.state.userName;
    _mobileController.text = _userBloc.state.mobile;
    _addressController.text = _userBloc.state.address;
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  profileEditBody() =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[formUI()]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();

    _nameController.dispose();
    _mobileController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
  }

  loginHeader() => Column(children: <Widget>[
        SizedBox(height: 60.0),
        Text(
          '$titleSignUp',
          style: TextStyle(
              fontFamily: quickFont, color: colorTitle, fontSize: 18.0),
        ),
        SizedBox(height: 20.0)
      ]);

  formUI() => Column(children: <Widget>[
        SizedBox(height: 20.0),
        _showNameInput(),
        _showMobileInput(),
        _showOldPasswordInput(),
        _showConfirmPasswordInput(),
        _showAddressInput(),
        SizedBox(height: 20.0),
        _showSignUpPressIcon(),
        SizedBox(height: 20.0)
      ]);

  _showNameInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_nameController,
          labelText: inputHintName,
          hintText: inputHintName,
          validation: validateEditName,
          keyboardType: TextInputType.text,
          maxLength: 15));

  _showMobileInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_mobileController,
          labelText: inputHintMobile,
          hintText: inputHintMobile,
          validation: validateEditMobile,
          keyboardType: TextInputType.phone,
          maxLength: 10));

  _showOldPasswordInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_oldPasswordController,
          labelText: inputHintOldPassword,
          hintText: inputHintOldPassword,
          obscureText: visible,
          validation: validateOldPassword,
          maxLength: 10,
          inkWell: InkWell(
              child: Icon(visible ? Icons.visibility_off : Icons.visibility),
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              })));

  _showConfirmPasswordInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_newPasswordController,
          labelText: inputHintNewPassword,
          hintText: inputHintNewPassword,
          maxLength: 10,
          obscureText: visible,
          validation: validateNewPassword,
          inkWell: InkWell(
              child: Icon(visible ? Icons.visibility_off : Icons.visibility),
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              })));

  _showAddressInput() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      child: widget.inputField(_addressController,
          labelText: inputHintAddress,
          hintText: inputHintAddress,
          validation: validateEditAddress,
          keyboardType: TextInputType.text,
          maxLength: 50));

  _showSignUpPressIcon() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () => _signUpValidate());

  _signUpValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      _userBloc.saveUserName(_nameController.text);
      _userBloc.saveMobile(_mobileController.text);
      _userBloc.saveAddress(_addressController.text);
      _userBloc.getLoginDetails();

      Navigator.pop(context);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  _scaffold() => CommonScaffold(
      actionFirstIcon: null,
      showAppBar: true,
      appTitle: titleProfileEdit,
      scaffoldKey: scaffoldKey,
      bodyData:
          Form(key: _key, autovalidate: _validate, child: profileEditBody()));
}

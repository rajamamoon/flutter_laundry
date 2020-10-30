import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whitedrywash/bloc/selectwashshop/select_wash_shop_bloc.dart';
import 'package:whitedrywash/bloc/user/user_bloc.dart';
import 'package:whitedrywash/bloc/washdeliveryaddress/wash_delivery_address_bloc.dart';
import 'package:whitedrywash/bloc/washdeliveryaddress/wash_delivery_address_state.dart';
import 'package:whitedrywash/ui/widget/common_scaffold.dart';
import 'package:whitedrywash/utils/vars.dart';
import 'package:whitedrywash/utils/extensions.dart';

class DryWashDeliveryAddressPage extends StatefulWidget {
  @override
  createState() => _DryWashDeliveryAddressState();
}

class _DryWashDeliveryAddressState extends State<DryWashDeliveryAddressPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _washShopPayController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _validate = false;
  bool visible = true;

  SelectWashShopBloc _selectWashShopBloc;
  WashDeliveryAddressBloc _washDeliveryAddressBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();

    _selectWashShopBloc = BlocProvider.of<SelectWashShopBloc>(context);
    _washDeliveryAddressBloc =
        BlocProvider.of<WashDeliveryAddressBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.getLoginDetails();

    _nameController.text = _userBloc.state.userName;
    _mobileController.text = _userBloc.state.mobile;
    _addressController.text = _userBloc.state.address;

    _washDeliveryAddressBloc.washTypeInput('Normal');
    _washDeliveryAddressBloc.nameInput(_nameController.text);
    _washDeliveryAddressBloc.mobileInput(_mobileController.text);
    _washDeliveryAddressBloc.addressInput(_addressController.text);
    _washDeliveryAddressBloc.washShopPayInput('0.0');
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

    _washShopPayController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
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
        Card(
            child: ListTile(
                leading: Icon(Icons.home),
                title: Text(_selectWashShopBloc.state.washShopName),
                subtitle: Text(_selectWashShopBloc.state.washShopAddress),
                trailing: Text(
                    symbolRs + _selectWashShopBloc.state.washTotal.toString(),
                    style: TextStyle(color: Colors.blueAccent)))),
        _showWashShopPayInput(),
        _showNameInput(),
        _showMobileInput(),
        _showAddressInput(),
        SizedBox(height: 20.0),
        _showSignUpPressIcon(),
        SizedBox(height: 20.0)
      ]);

  _showWashShopPayInput() => BlocBuilder(
      bloc: _washDeliveryAddressBloc,
      builder: (BuildContext context, WashDeliveryAddressState state) =>
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: widget.inputField(_washShopPayController,
                  labelText: inputHintWashShopPay,
                  hintText: inputHintWashShopPay,
                  onChanged: _washDeliveryAddressBloc.washShopPayInput,
                  keyboardType: TextInputType.number)));

  _showNameInput() => BlocBuilder(
      bloc: _washDeliveryAddressBloc,
      builder: (BuildContext context, WashDeliveryAddressState state) =>
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: widget.inputField(_nameController,
                  labelText: inputHintName,
                  hintText: inputHintName,
                  onChanged: _washDeliveryAddressBloc.nameInput,
                  validation: validateName,
                  keyboardType: TextInputType.text,
                  maxLength: 15)));

  _showMobileInput() => BlocBuilder(
      bloc: _washDeliveryAddressBloc,
      builder: (BuildContext context, WashDeliveryAddressState state) =>
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: widget.inputField(_mobileController,
                  labelText: inputHintMobile,
                  hintText: inputHintMobile,
                  validation: validateMobile,
                  onChanged: _washDeliveryAddressBloc.mobileInput,
                  keyboardType: TextInputType.phone,
                  maxLength: 10)));

  _showAddressInput() => BlocBuilder(
      bloc: _washDeliveryAddressBloc,
      builder: (BuildContext context, WashDeliveryAddressState state) =>
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: widget.inputField(_addressController,
                  labelText: inputHintAddress,
                  hintText: inputHintAddress,
                  validation: validateAddress,
                  onChanged: _washDeliveryAddressBloc.addressInput,
                  keyboardType: TextInputType.text,
                  maxLength: 50)));

  _showSignUpPressIcon() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () => _signUpValidate());

  _signUpValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      FocusScope.of(context).requestFocus(FocusNode());
      Navigator.pushNamed(context, qrCodeRoute);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  _scaffold() => CommonScaffold(
      actionFirstIcon: null,
      showAppBar: true,
      appTitle: titleDeliveryAddress,
      scaffoldKey: scaffoldKey,
      bodyData:
          Form(key: _key, autovalidate: _validate, child: profileEditBody()));
}

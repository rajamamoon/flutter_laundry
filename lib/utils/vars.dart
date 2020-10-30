import 'dart:ui';
import 'package:flutter/material.dart';

const String appName = 'White Dry Wash';
const String companyName = 'White Dry Wash';

const String symbolRs = '\u20B9 ';

const String tabCurrentOrder = 'Current Order';
const String tabPastOrder = 'Past Order';

const String drawerHome = 'Home';
const String drawerProfile = 'Profile';
const String drawerDashboard = 'Dashboard';
const String drawerContactUs = 'Contact Us';
const String drawerLogout = 'Logout';

const String titleWelcome = 'Welcome to';
const String titleSignInContinue = 'Sign in to continue';
const String titleSignUp= 'Sign Up';
const String titleForgotPassword= 'Forgot Password';
const String titleContactUs = 'Contact Us';
const String titleDashboard = 'Dashboard';
const String titleProfileEdit = 'Profile Edit';
const String titleDeliveryAddress = 'Delivery Address';
const String titleDryWash = 'Dry Wash';
const String titleSelectWashShop = 'Select Wash Shop';
const String titleSelectWashItem = 'Select Wash Item';
const String titleScanQRCode = 'Scan QR Code';

const inputHintName = 'Name';
const inputHintMobile = 'Mobile';
const inputHintPassword = 'Password';
const inputHintConfirmPassword = 'Confirm password';
const inputHintOldPassword = 'Old Password';
const inputHintNewPassword = 'New Password';
const inputHintAddress = 'Address';
const inputHintWashShopPay = 'Wash Shop Pay';

const labelForgotPassword = 'Forgot Password';
const labelSignUp = "Sign Up";
const labelDoNotAccount = "Dont't have an account?";
const labelCity = 'City';
const labelArea = 'Area';
const labelWashShop = 'Wash Shop';
const labelForgotPasswordA = "That's ok ....";
const labelForgotPasswordB = 'Just enter the mobile you have used to sign up with us and we will send you a current password!';
const labelForgotPasswordC = "Did someone forget their password?";

const String msgNoData = 'No Data';

//TODO LABEL

//TODO FONT NAME
const String quickFont = 'Quicksand';
const String ralewayFont = 'Raleway';

const String quickSandMediumFont = 'quicksand_medium.ttf';
const String quickSandBoldFont = 'quicksand_bold.otf';

const String ralewayRegularFont = 'raleway_regular.ttf';
const String ralewayMediumFont = 'raleway_medium.ttf';

//TODO ROUTE
const String homeRoute = '/homepage';
const String SplashScreenRoute = '/splash_screen';
const String loginRoute = '/login';
const String signUpRoute = '/signup';
const String forgotPasswordRoute = '/forgot_password';
const String tabRoute = '/tab';
const String profileRoute = '/profile';
const String profileEditRoute = '/profileEdit';
const String contactRoute = '/contact';
const String dashboardRoute = '/dashboard';
const String dryWashRoute = '/dryWash';
const String dryWashDeliveryAddressRoute = '/dryWashDeliveryAddress';
const String selectWashItemRoute = '/selectWashItem';
const String selectWashShopRoute = '/selectWashShop';
const String qrCodeRoute = '/qrCode';

const String btnDone = 'DONE';
const String btnCancel = 'CANCEL';
const String btnSelectDryWashShop = 'SELECT DRY WASH SHOP';
const String btnSubmit = 'SUBMIT';
const String btnNext = 'NEXT';

const String profileImage = 'assets/images/user_profile.png';
const String whiteDryWashImage = 'assets/images/white_dry_wash.png';

//TODO COLOR
const Color colorRoundText = Colors.grey;
Color colorRoundTextBg = Colors.grey.withOpacity(0.1);
Color colorIconCall = Colors.orange.shade200;
Color colorIconMap = Colors.blue.shade200;
const Color colorOrderId = Colors.blue;
const Color colorOrderPayAmount = Colors.orange;
const Color colorOrderAmount = Colors.grey;
const Color colorOrderCompleteDateTime = Colors.green;
const Color colorShopAddress = Colors.black45;
const Color colorDeliveryAddress = Colors.teal;

const Color colorDate = Colors.black26;
const Color colorRs = Colors.lightBlue;
const Color colorName = Colors.black;

const Color colorMobile = Colors.grey;

const Color colorReason = Colors.deepOrangeAccent;
const Color colorNoData = Colors.grey;
const Color colorLink = Colors.black;

const Color colorProgressBar = Colors.blue;
const Color colorTitle = Colors.blue;

List<Color> gradientsClipper = [
  Colors.grey.shade200,
  Colors.white
];

List<Color> gradientsButton = [Colors.grey.shade200, Colors.white];

List<Color> kitGradients = [
  Colors.grey.shade100,
  Colors.grey.shade200,
];

//TODO WIDGET
expandStyle(int flex, Widget child) => Expanded(flex: flex, child: child);

//VALIDATION
String validateMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.replaceAll(" ", "").isEmpty) {
    return 'Mobile is required';
  } else if (value.replaceAll(" ", "").length != 10) {
    return 'Mobile number must 10 digits';
  } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
    return 'Mobile number must be digits';
  }
  return null;
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 4) {
    return 'Password must be at least 4 characters';
  }
  return null;
}

String validateOldPassword(String value) {
  if (value.isEmpty) {
    return null;
  } else if (value.length < 4) {
    return 'Old password must be at least 4 characters';
  }
  return null;
}

String validateNewPassword(String value) {
  if (value.isEmpty) {
    return null;
  } else if (value.length < 4) {
    return 'New password must be at least 4 characters';
  }
  return null;
}

String validateConfirmPassword(String value) {
  if (value.isEmpty) {
    return 'Confirm password is required';
  } else if (value.length < 4) {
    return 'Confirm password must be at least 4 characters';
  }
  return null;
}

String validateEditName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Name must be a-z and A-Z';
  }
  return null;
}

String validateEditMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.replaceAll(" ", "").isEmpty) {
    return null;
  } else if (value.replaceAll(" ", "").length != 10) {
    return 'Mobile number must 10 digits';
  } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
    return 'Mobile number must be digits';
  }
  return null;
}

bool validationEqual(String currentValue, String checkValue) {
  if (currentValue == checkValue) {
    return true;
  } else {
    return false;
  }
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Name is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Name must be a-z and A-Z';
  }
  return null;
}

String validateAddress(String value) {
  String pattern = r'(^[a-zA-Z0-9-, ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Address is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Address must be text and numeric';
  }
  return null;
}

String validateEditAddress(String value) {
  String pattern = r'(^[a-zA-Z0-9-, ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Address must be text and numeric';
  }
  return null;
}

String validateEmpty(String value) {
  if (value.isEmpty) {
    return 'Why mobile not repair?';
  }
  return null;
}



int ok200 = 200;
String apiCode1 = '1';

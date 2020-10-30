import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/currentorder/current_order_bloc.dart';
import 'bloc/drywash/dry_wash_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/pastorder/past_order_bloc.dart';
import 'bloc/selectwashshop/select_wash_shop_bloc.dart';
import 'bloc/signup/sign_up_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'bloc/washdeliveryaddress/wash_delivery_address_bloc.dart';
import 'service/di/dependency_injection.dart';
import 'ui/page/contact_page.dart';
import 'ui/page/dashboard_page.dart';
import 'ui/page/dry_wash_delivery_address.dart';
import 'ui/page/dry_wash_page.dart';
import 'ui/page/forgot_password_page.dart';
import 'ui/page/login_page.dart';
import 'ui/page/profile_page.dart';
import 'ui/page/qr_code_page.dart';
import 'ui/page/select_wash_item_page.dart';
import 'ui/page/select_wash_shop_page.dart';
import 'ui/page/sign_up_page.dart';
import 'ui/page/splash_screen.dart';
import 'ui/page/profile_edit_page.dart';
import 'ui/page/tab/tab_order.dart';
import 'utils/vars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.black,
      statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(dark);

  Injector.configure(Flavor.Testing);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: appName,
      theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.blue,
          primaryColor: Colors.blueAccent,
          primarySwatch: Colors.blue,
          fontFamily: quickFont),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      initialRoute: '/',

      //routes
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreenPage(),
        loginRoute: (BuildContext context) => LoginPage(),
        signUpRoute: (BuildContext context) => SignUpPage(),
        forgotPasswordRoute: (BuildContext context) => ForgotPasswordPage(),
        tabRoute: (BuildContext c) => TabOrderPage(),
        profileRoute: (BuildContext c) => ProfilePage(),
        profileEditRoute: (BuildContext c) => ProfileEditPage(),
        contactRoute: (BuildContext c) => ContactPage(),
        dashboardRoute: (BuildContext c) => DashBoardPage(),
        dryWashRoute: (BuildContext c) => DryWashPage(),
        selectWashItemRoute: (BuildContext c) => SelectWashItemPage(),
        selectWashShopRoute: (BuildContext c) => SelectWashShopPage(),
        dryWashDeliveryAddressRoute: (BuildContext c) =>
            DryWashDeliveryAddressPage(),
        qrCodeRoute: (BuildContext c) => QRCodePage(),
      });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocProvider(
            create: (context) => UserBloc(),
            child: BlocProvider(
                create: (context) => CurrentOrderBloc(),
                child: BlocProvider(
                    create: (context) => PastOrderBloc(),
                    child: BlocProvider(
                        create: (context) => DryWashBloc(),
                        child: BlocProvider(
                            create: (context) => SelectWashShopBloc(),
                            child: BlocProvider(
                                create: (context) => WashDeliveryAddressBloc(),
                                child: BlocProvider(
                                    create: (context) => SignUpBloc(),
                                    child: materialApp))))))));
  }
}

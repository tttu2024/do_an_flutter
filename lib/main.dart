
import 'package:do_an/pages/addcart/notification.dart';
import 'package:do_an/pages/start.dart';
import 'package:do_an/providers/cart_provider.dart';
import 'package:do_an/pages/user/detailbilldistroy.dart';
import 'package:do_an/pages/user/forgetpass.dart';
import 'package:do_an/pages/user/login.dart';
import 'package:do_an/pages/user/orderdetail.dart';
import 'package:do_an/pages/user/resondistroy.dart';
import 'package:do_an/pages/user/signup.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUp(),
          '/orderdetail': (context) => const OrderDetail(),
          '/resondistroy': (context) => const Resondistroy(),
          '/detailbilldistroy': (context) => const DetailBills(),
          //'/detailuser': (context) => const DetailUser(),
          '/forgetpass': (context) => const ForgetPassPhone(),
          '/notification': (context) => const NotificationCart(),
        },
      ),
    );
  }
}

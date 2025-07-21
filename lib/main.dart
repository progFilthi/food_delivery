import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/authentication/create_account_screen.dart';
import 'package:food_delivery_app/screens/authentication/verification_code_screen.dart';
import 'package:food_delivery_app/screens/authentication/login_screen.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/screens/home/vendor_details_screen.dart';
import 'package:food_delivery_app/screens/home/item_details_screen.dart';
import 'package:food_delivery_app/screens/orders/orders_screen.dart';
import 'package:food_delivery_app/screens/orders/order_status_screen.dart';
import 'package:food_delivery_app/screens/orders/order_summary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter', // Assuming 'Inter' font is available or default
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CreateAccountScreen(),
        '/verification': (context) => const VerificationCodeScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/vendor_details': (context) => const VendorDetailsScreen(),
        '/item_details': (context) => const ItemDetailsScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/order_status': (context) => const OrderStatusScreen(),
        '/order_summary': (context) => const OrderSummaryScreen(),
      },
    );
  }
}

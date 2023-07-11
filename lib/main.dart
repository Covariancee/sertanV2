import 'package:flutter/material.dart';
import 'package:sertan/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:sertan/provider/city_and_district_provider.dart';
import 'package:sertan/provider/function_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CityDistrictProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => FunctionProvider(context: context),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPageView(),
    );
  }
}

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:sertan/provider/category_provider.dart';
=======
>>>>>>> b8dd565923e10697b867e40548a69f975a2cb35e
import 'package:sertan/pages/category_page.dart';
import 'package:sertan/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:sertan/pages/profile_page.dart';
import 'package:sertan/pages/register_page.dart';
import 'package:sertan/provider/city_and_district_provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CityDistrictProvider(),
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
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => RegisterPageView(),
        '/login-page': (context) => LoginPageView(),
        '/profile-page':(context) => ProfilePage()
      },
    );
  }
}

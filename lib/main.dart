import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:provider/provider.dart';
import 'package:sertan/pages/category_page.dart';
>>>>>>> 84346f0d2b98cede56b4709f52b5223fef39cfb1
import 'package:sertan/pages/login_page.dart';
import 'package:sertan/pages/profile_page.dart';
import 'package:sertan/pages/register_page.dart';
import 'package:sertan/pages/terms_page.dart';
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
        '/profile-page': (context) => ProfilePage(),
        '/terms-page': (context) => const TermsPage(),
        '/category-page': (context) => CategoryPageView(),
      },
    );
  }
}

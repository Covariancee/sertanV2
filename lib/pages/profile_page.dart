import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/city_and_district_list.dart';
import 'package:sertan/models/user.dart';
import 'package:sertan/pages/category_page.dart';
import 'package:sertan/pages/login_page.dart';
import 'package:sertan/pages/terms_page.dart';
import 'package:sertan/widgets/custom_cupertino_button.dart';

import '../controller/register_controller.dart';
import '../controller/validators.dart';
import '../provider/city_and_district_provider.dart';
import '../widgets/text_input.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
  final _formKey = GlobalKey<FormState>();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
    bool visible = cityProvider.isCitySelected;
    final userInfo = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text("Name & Surname:  ${userInfo.nameSurname}"),
                    Text("Email:  ${userInfo.emailAddress}"),
                    Text("Phone Number:  ${userInfo.phoneNumber}"),
                    Text("Password:  ${userInfo.password}"),
                    RichText(
                      text: TextSpan(
                        text: 'Address: ',
                        
                        children: <TextSpan>[
                          TextSpan(
                              text: "${cityProvider.selectedCity}/",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: cityProvider.selectedDistrict),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CategoryPageView()));
                        },
                        child: const Text("Category Page"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/models/user.dart';
import 'package:sertan/pages/category_page.dart';

import '../provider/city_and_district_provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
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

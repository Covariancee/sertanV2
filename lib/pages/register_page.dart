import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/city_and_district_list.dart';
import 'package:sertan/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import '../provider/city_and_district_provider.dart';
import '../widgets/text_input.dart';
import '../controller/function_controller.dart';
import 'login_page.dart';

class RegisterPageView extends StatefulWidget {
  RegisterPageView({
    super.key,
  });
  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
  final _formKey = GlobalKey<FormState>();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();

  TextEditingController phoneRegisterController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
    //final functionProvider = Provider.of<FunctionProvider>(context);
    bool visible = cityProvider.isCitySelected;
 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/vtz_background.png"),
                fit: BoxFit.cover)),
        child: Form(
          key: widget._formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Stack(children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(width: 200, child: Image.asset("assets/vtz_logo.png")),
                NameInput(
                  controller: nameController,
                ),
                SurnameInput(
                  controller: surnameController,
                ),
                PhoneInput(
                  controller: phoneRegisterController,
                ),
                EmailInput(controller: emailController),
                PasswordInput(controller: passwordRegisterController),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: CupertinoButton(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.blue,
                    onPressed: () => FunctionProvider(
                            context: context,
                            pickerText:
                                List<Widget>.generate(cities.length, (index) {
                              return Center(
                                child: Text(
                                  cities[index],

                                  //districts[cityProvider.selectedCity]![index],
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            }),
                            confirmFunc: (value) {
                            
                              cityProvider.setSelectedCity = cities[value];
                              if (districts[cityProvider.selectedCity] !=
                                  null) {
                                cityProvider.setSelectedDistrict =
                                    districts[cityProvider.selectedCity]![0];
                              }
                            },
                           )
                        .showPicker(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          cityProvider.selectedCity,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Visibility(
                  visible: visible,
                  child: CupertinoButton(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cityProvider.selectedDistrict,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    onPressed: () => FunctionProvider(
                      context: context,
                      
                      pickerText: List<Widget>.generate(districts.length, (value) {
                        return Center(
                          child: Text(
                            districts[cityProvider.selectedCity]![value],
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }),
                      confirmFunc: (value) => cityProvider.setSelectedDistrict =
                          districts[cityProvider.selectedCity]![value],
                      
                    ).showPicker(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState!.validate()) {
                        print(
                            "ID: ${phoneRegisterController.text} Name Surname: ${nameController.text} ${surnameController.text} Password: ${passwordRegisterController.text} City&District: ${cityProvider.selectedCity} ${cityProvider.selectedDistrict} Email: ${emailController.text}");
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (context) => LoginPageView()));
                      }
                    },
                    child: const Text("Register")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => LoginPageView()));
                    },
                    child: const Text("Login"))
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}

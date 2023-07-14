import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/city_and_district_list.dart';

import '../provider/city_and_district_provider.dart';

class FunctionProvider {
  BuildContext context;
  FunctionProvider(
      {required this.context,
      required this.pickerText,
      required this.confirmFunc,
      required this.index});
  int index;
  int value = 0;
  List<Widget> pickerText;
  final confirmFunc;
  bool visible = false;
  void showPicker() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                    onPressed: () {
                      confirmFunc;
                      Navigator.of(context).pop();
                      // cityProvider.setSelectedCity = cities[value];

                      // cityProvider.setSelectedDistrict = districts[cityProvider.selectedCity]![value];
                    },
                    child: const Text("Confirm"),
                  )
                ],
              ),
              SizedBox(
                height: 150.0,
                child: CupertinoPicker(
                  itemExtent: 32.0,
                  onSelectedItemChanged: (index) {
                    value = index;
                  },
                  children: pickerText,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

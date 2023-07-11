import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/city_and_district_list.dart';

import 'city_and_district_provider.dart';

class FunctionProvider with ChangeNotifier {
  FunctionProvider({required this.context});
  BuildContext context;
  void showPicker() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          final cityProvider = Provider.of<CityDistrictProvider>(context);
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: const Text("Confirm")),
                    TextButton(onPressed: () {}, child: const Text("Cancel")),
                  ],
                ),
                CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      cityProvider.setSelectedCity = cities[index];
                    },
                    children: List<Widget>.generate(
                        cities.length,
                        (index) => Center(
                              child: Text(cities[index]),
                            )))
              ],
            ),
          );
        });
  }
}

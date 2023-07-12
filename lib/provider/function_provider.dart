import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/city_and_district_list.dart';

import 'city_and_district_provider.dart';

class FunctionProvider with ChangeNotifier {
  BuildContext context;
  FunctionProvider({required this.context});

  void showPicker() {
    final cityProvider =
        Provider.of<CityDistrictProvider>(context, listen: false);
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
                  TextButton(onPressed: () {}, child: const Text("Cancel")),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Confirm"),
                  )
                ],
              ),
              SizedBox(
                height: 150.0,
                child: CupertinoPicker(
                  itemExtent: 32.0,
                  onSelectedItemChanged: (index) {
                    cityProvider.setSelectedCity = cities[index];
                  },
                  children: List<Widget>.generate(cities.length, (index) {
                    return Center(
                      child: Text(
                        cities[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

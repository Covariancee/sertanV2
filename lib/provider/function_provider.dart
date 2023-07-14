import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/city_and_district_list.dart';

import 'city_and_district_provider.dart';

class FunctionProvider with ChangeNotifier {
  BuildContext context;
  FunctionProvider({
    required this.context,
  });
  int value = 0;
  bool visible = false;
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
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                    onPressed: () {
                      print(districts[cityProvider.selectedCity]);

                      Navigator.of(context).pop();
                      cityProvider.setSelectedCity = cities[value];
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

  void showPicker2() {
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
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      cityProvider.setSelectedDistrict =
                          districts[cityProvider.selectedCity]![value];
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
                  children: List<Widget>.generate(districts.length, (index) {
                    return Center(
                      child: Text(
                        districts[cityProvider.selectedCity]![index],
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

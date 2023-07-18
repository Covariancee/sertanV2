import 'package:flutter/material.dart';
import '../provider/city_and_district_provider.dart';
import 'package:provider/provider.dart';

class AlertForm extends StatefulWidget {
  const AlertForm({required StringalertMesage,super.key});
  @override
  AlertFormState createState() => AlertFormState();
}

class AlertFormState extends State<AlertForm> {
  String cityAlert = ('city and district should be selected');
  String termsAlert = ('Terms should be accepted');
  late String alert;
  void showDialogBox(BuildContext context) {
    final cityProvider = Provider.of<CityDistrictProvider>(context);
    if (cityProvider.isCitySelected == false) {
      alert = cityAlert;
    } else if (cityProvider.isAccepted == false) {
      alert = termsAlert;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text(alert),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

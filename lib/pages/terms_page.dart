import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:sertan/provider/city_and_district_provider.dart';
=======
>>>>>>> c0fef433b39f03dc6bef75cd54a96c5852800d01

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final cityProvider =
        Provider.of<CityDistrictProvider>(context, listen: false);
=======
>>>>>>> c0fef433b39f03dc6bef75cd54a96c5852800d01
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'READ THIS',
              style: TextStyle(color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
<<<<<<< HEAD
                child: Text('Readed')),
=======
                child: Text('accept'))
>>>>>>> c0fef433b39f03dc6bef75cd54a96c5852800d01
          ],
        ),
      ),
    );
  }
}

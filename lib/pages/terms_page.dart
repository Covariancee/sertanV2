import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sertan/provider/city_and_district_provider.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cityProvider =
    //     Provider.of<CityDistrictProvider>(context, listen: false);
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
                child: const Text('Read')),
          ],
        ),
      ),
    );
  }
}

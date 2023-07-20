import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FunctionProvider {
  BuildContext context;
  FunctionProvider({
    required this.context,
    required this.pickerText,
    required this.confirmFunc,
  });

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
                      confirmFunc(value);
                      Navigator.of(context).pop();
                     
                     
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

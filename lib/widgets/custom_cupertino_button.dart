import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../controller/function_controller.dart';
import '../controller/register_controller.dart';
class CustomCupertinoButton extends StatelessWidget {
  const CustomCupertinoButton({super.key ,required this.selectedAny, required this.generateListVar,required this.setSelectedAny});
    final String selectedAny;
    // ignore: prefer_typing_uninitialized_variables
    final  setSelectedAny;
    final  generateListVar;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedAny,
            style: const TextStyle(color: Colors.white),
          ),
          const Icon(Icons.keyboard_arrow_down)
        ],
      ),
      onPressed: () => FunctionProvider(
        context: context,
        pickerText:
            ListGenerate().GenerateList(generateListVar),
        confirmFunc: setSelectedAny,
      ).showPicker(),
    );
  }
}

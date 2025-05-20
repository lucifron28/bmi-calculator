import 'package:flutter/material.dart';
import 'unit_text_form_field.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String? selectedWeightUnit = "kg";
  final List<String> weightUnits = ["kg", "lbs"];

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: UnitTextFormField(
            controller: heightController,
            labelText: "Enter Weight",
            selectedUnit: selectedWeightUnit,
            units: weightUnits,
            onUnitChanged: (value) {
              setState(() {
                selectedWeightUnit = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) return "Please Enter a Number";
            },
          ),
        ),
      ],
    );
  }
}

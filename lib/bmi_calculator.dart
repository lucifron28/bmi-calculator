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
  List<String> weightUnits = ["kg", "lbs"];

  String? selectedHeightUnit = "cm";
  List<String> heightUnits = ["cm", "inch"];
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
        UnitTextFormField(
          controller: heightController,
          labelText: "Enter Weight",
          selectedUnit: selectedHeightUnit,
          units: heightUnits,
          onUnitChanged: (value) {
            setState(() {
              selectedHeightUnit = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter a Number";
            }
            if (!isNumeric(value)) {
              return "Invalid number format";
            }
          },
        ),
        UnitTextFormField(
          controller: heightController,
          labelText: "Enter Height",
          selectedUnit: selectedWeightUnit,
          units: weightUnits,
          onUnitChanged: (value) {
            setState(() {
              selectedWeightUnit = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter a Number";
            }
            if (!isNumeric(value)) {
              return "Invalid number format";
            }
          },
        ),
      ],
    );
  }
}

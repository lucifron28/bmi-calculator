import 'package:bmi_calculator/app.dart';
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
  String resultBMI = "Calculate your BMI";

  String? selectedWeightUnit = "kg";
  List<String> weightUnits = ["kg", "lbs"];

  String? selectedHeightUnit = "cm";
  List<String> heightUnits = ["cm", "in", "m"];
  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

double calculateBMI(double height, double weight) {
  if (selectedHeightUnit == "cm") {
    height = height / 100;
  } else if (selectedHeightUnit == "in") {
    height = height * 0.0254;
  } else if (selectedHeightUnit == "m") {
  }

  if (selectedWeightUnit == "lbs") {
    weight = weight * 0.453592;
  }

  return weight / (height * height);
}



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Your BMI: "),
        Text(resultBMI),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UnitTextFormField(
                controller: weightController,
                labelText: "Enter Weight",
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
              SizedBox(height: 20),
              UnitTextFormField(
                controller: heightController,
                labelText: "Enter Height",
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
                  return null;
                },
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            double bmi = calculateBMI(
              double.parse(heightController.text.trim()),
              double.parse(weightController.text.trim()),
            );
            setState(() {
              resultBMI = bmi.toString();
            });
          },
          child: Text("Submit"),
        ),
      ],
    );
  }
}

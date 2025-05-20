import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String? selectedUnit = "kg";

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
        TextFormField(
          controller: weightController,
          decoration: InputDecoration(
            labelText: "Enter Height",
            suffixIcon: DropdownButton<String>(
              value: selectedUnit,
              items:
                  ["kg", "lbs"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedUnit = newValue!;
                });
              }
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return "Please enter a number";
            if (!isNumeric(value)) return "Invalid number Format";
            if (double.parse(value) < 0) {
              return "Please enter a positive number";
            }
            return null;
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class UnitTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? selectedUnit;
  final List<String> units;
  final void Function(String?) onUnitChanged;
  final String? Function(String?)? validator;
  const UnitTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.selectedUnit,
    required this.units,
    required this.onUnitChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: SizedBox(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: selectedUnit,
              items:
                  units.map((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
              onChanged: onUnitChanged,
            ),
          ),
        ),
      ),
      validator: validator,
    );
  }
}

import 'package:flutter/material.dart';

class AppDropdownButtonFormField extends StatefulWidget {
  final String? labelText;
  final List<String>? list;
  final String? dropdownValue;
  final String? Function(String? value)? selectedItem;
  final String? Function(String?)? validator;

  const AppDropdownButtonFormField({
    super.key,
    required this.list,
    required this.dropdownValue,
    this.labelText,
    this.selectedItem,
    this.validator,
  });

  @override
  State<AppDropdownButtonFormField> createState() => _AppDropdownButtonFormFieldState();
}

class _AppDropdownButtonFormFieldState extends State<AppDropdownButtonFormField> {
  String? initialValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.list ?? [];
    return DropdownButtonFormField<String>(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: initialValue,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: const BorderSide(
            color: Colors.black45,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: const BorderSide(
            color: Colors.black45,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: const BorderSide(
            color: Colors.black45,
          ),
        ),
      ),
      items: list.map<DropdownMenuItem<String>>((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: ((value) {
        setState(() {
          initialValue = value;
        });
        widget.selectedItem?.call(value);
      }),
    );
  }
}

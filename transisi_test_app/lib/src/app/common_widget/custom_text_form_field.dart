import 'package:flutter/material.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.labelText,
      this.controller,
      this.formKey,
      this.hasValidation = false,
      this.isPhoneNumber = false});
  final Icon icon;
  final TextEditingController? controller;
  final String labelText;
  final bool? isPhoneNumber;
  final GlobalKey<FormState>? formKey;
  final bool? hasValidation;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  String? errorText;
  bool isError = false;

  @override
  void initState() {
    _focusNode.addListener(_handleFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: [
          Icon(
            widget.icon.icon,
            color: _isFocused ? primaryColor : Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Form(
              key: widget.formKey,
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                maxLength: widget.isPhoneNumber! ? 16 : null,
                keyboardType:
                    widget.isPhoneNumber! ? TextInputType.number : null,
                decoration: InputDecoration(
                  errorText: isError
                      ? errorText
                      : null, // Gunakan null ketika tidak ada kesalahan
                  labelText: widget.labelText,
                  labelStyle: TextStyle(
                    color: _isFocused ? primaryColor : Colors.grey,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 3, 66, 117),
                    ),
                  ),
                ),
                validator: (value) {
                  if (widget.hasValidation!) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        errorText = '${widget.labelText} is required';
                        isError = true;
                      });
                      return errorText;
                    } else {
                      setState(() {
                        isError = false;
                        errorText = null;
                      });
                      return null;
                    }
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

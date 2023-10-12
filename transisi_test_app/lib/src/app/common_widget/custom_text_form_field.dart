import 'package:flutter/material.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.labelText,
      this.controller,
      this.isPhoneNumber = false});
  final Icon icon;
  final TextEditingController? controller;
  final String labelText;
  final bool? isPhoneNumber;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

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
            color: _isFocused ? prymaryColor : Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: widget.isPhoneNumber!
                ? TextFormField(
                    focusNode: _focusNode,
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: widget.labelText,
                        labelStyle: TextStyle(
                            color: _isFocused ? prymaryColor : Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 3, 66, 117),
                        ))),
                  )
                : TextFormField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                        labelText: widget.labelText,
                        labelStyle: TextStyle(
                            color: _isFocused ? prymaryColor : Colors.grey),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 3, 66, 117),
                        ))),
                  ),
          ),
        ],
      ),
    );
  }
}

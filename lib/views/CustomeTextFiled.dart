import 'package:flutter/material.dart';

import 'Constatnts.dart';

class CustomeTextFiled extends StatelessWidget {
  const CustomeTextFiled({super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChange});
  final String hint;
  final int maxLines;
  final void Function (String?)? onSaved;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSaved,
      validator: (value) {

        if(value?.isEmpty?? true){
          return 'Field is required';
        }else{
          return null;
        }
      },
      cursorColor: kprimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kprimaryColor),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}

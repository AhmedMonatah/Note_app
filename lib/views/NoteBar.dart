import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomeSearchIcon.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key, required this.titel, required this.icon, this.onPressed});
  final String titel;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
       const Spacer(),
        CustomeSearchIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}

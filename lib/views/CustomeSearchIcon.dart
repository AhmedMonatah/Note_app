import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeSearchIcon extends StatelessWidget {
  const CustomeSearchIcon({super.key, required this.icon, this.onPressed});
 final IconData icon;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 46,
      decoration:  BoxDecoration(
        color:Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16)
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon
            ,size: 28
            ),
        )
        );

  }
}

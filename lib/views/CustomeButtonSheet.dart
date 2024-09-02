import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constatnts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 53,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kprimaryColor),
        child:  Center(
            child:isLoading?const SizedBox(
              height: 24,
              width: 24,
              child:  CircularProgressIndicator(
                color: Colors.black,
              ),
            ):const Text(
          'Add',
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

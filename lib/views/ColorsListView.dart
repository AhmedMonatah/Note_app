import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note_cubit/cubit/add_note_cubit.dart';

import 'Constatnts.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
    final bool isActive;
    final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive? CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    )  :  CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}
class ColorsLisView extends StatefulWidget {
  const ColorsLisView({super.key});

  @override
  State<ColorsLisView> createState() => _ColorsLisViewState();
}

class _ColorsLisViewState extends State<ColorsLisView> {
  int currentIndex=0;

  @override 
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: Kcolors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) {
          return  Padding(
            padding:const EdgeInsets.symmetric(horizontal: 6),
            child:GestureDetector(
              onTap: () {
                currentIndex=index;
                BlocProvider.of<AddNoteCubit>(context).color=Kcolors[index];
                setState(() {
                  
                });
              },
              child: ColorItem(
                color: Kcolors[index],
                isActive: currentIndex==index,
              ),
            ),
          );
        }, 
      ),
    );
  }
}
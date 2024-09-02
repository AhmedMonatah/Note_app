import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/views/ColorsListView.dart';
import 'package:note_app/views/CustomeTextFiled.dart';
import 'package:note_app/views/NoteBar.dart';

import '../add_note_cubit/cubit/add_note_cubit.dart';
import 'Constatnts.dart';
import 'EditColorView.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? titel,cotent;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
        const  SizedBox(height: 50,),
          CustomeAppBar(
            onPressed: () {
              widget.note.titel=titel?? widget.note.titel;
              widget.note.subTitle=cotent?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context); 
            },
            icon: Icons.check ,
            titel: 'Edit Note',
          ),
       const SizedBox( height: 50,),
         CustomeTextFiled(
        onChange:(value) {
          titel=value;
        }, 
        hint: widget.note.titel
        ),
       const  SizedBox( height: 16,),
         CustomeTextFiled(
        onChange: (value) {  
          cotent=value;
        },
        hint: widget.note.subTitle,
        maxLines: 5,),
       const SizedBox(height: 30,),
           EditNoteColorList(
        noteModel: widget.note,
       ),

        ],
         
      ),
    );
  }
}
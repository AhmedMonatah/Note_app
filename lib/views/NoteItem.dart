import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/notes_cubit/notes_cubit_cubit.dart';
import 'package:note_app/widgets/EditNoteView.dart';

import '../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return  EditNoteView(
              note: note,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color:  Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title:  Padding(
              padding:const  EdgeInsets.only(bottom: 13),
              child: Text(
                note.titel,
                style:const TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            subtitle: Text(
              note.subTitle,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 17),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30, 
              ),
              onPressed: () {
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();              },
            ),
          ),
          Text(
            note.date,
            style:
                TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 14),
          )
        ]),
      ),
    );
  }
}

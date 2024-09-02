import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:note_app/notes_cubit/notes_cubit_cubit.dart';

import 'AddNoteForm.dart';


class AddNoteBottomSheet extends StatelessWidget {
 const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context)  {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit(),)
      ],
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if(state is AddNoteFailure){
          } if(state is AddNoteSuccess){
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading?true:false,
            child: Padding(
            padding: EdgeInsets.only(right:17.0,left: 17,
            bottom:MediaQuery.of(context).viewInsets.bottom ),
              child: const SingleChildScrollView(
                child:AddLocalSheet()
                ),
            ),
          );
        },
      ),
    );
  }
}

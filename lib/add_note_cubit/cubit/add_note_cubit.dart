import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/Constatnts.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color=const Color(0xffAc3931);
  addNote(NoteModel note)async{
    note.color=color!.value;
    emit(AddNoteLoading());
  try {
  var notesBox= Hive.box<NoteModel>(kNoteBox);
  await notesBox.add(note); 
  emit(AddNoteSuccess());

} on Exception catch (e) {
 emit(AddNoteFailure(e.toString()));
}
  }
}


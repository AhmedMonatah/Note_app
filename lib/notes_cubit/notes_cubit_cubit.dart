import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:note_app/models/note_model.dart';

import '../views/Constatnts.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesCubitInitial());
  
  List<NoteModel>? notes = [];
  List<NoteModel>? allNotes = [];  // Store all notes here

  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    allNotes = notesBox.values.toList();
    notes = allNotes;  // Initially, display all notes
    emit(NotesCubitSuccess());
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      notes = allNotes;  // Reset to all notes if the search query is empty
    } else {
      notes = allNotes?.where((note) => 
          note.titel.toLowerCase().contains(query.toLowerCase()) ||
          note.subTitle.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
    emit(NotesCubitSuccess());
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/notes_cubit/notes_cubit_cubit.dart';

import 'NoteBar.dart';
import 'NotsListView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear();
      }
    });
  }

  void performSearch(String query) {
    // Implement your search logic here.
    // For example, filter the notes based on the query.
    BlocProvider.of<NotesCubit>(context).searchNotes(query); // Assuming you have a method to search notes
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        isSearching
            ? TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search notes...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: toggleSearch,
                  ),
                ),
                onChanged: performSearch,
              )
            : CustomeAppBar(
                icon: Icons.search,
                titel: 'Note',
                onPressed: toggleSearch,
              ),
        const Expanded(child: NotesListView()),
      ]),
    );
  }
}

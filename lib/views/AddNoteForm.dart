import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/add_note_cubit/cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'ColorsListView.dart';
import 'CustomeButtonSheet.dart';
import 'CustomeTextFiled.dart';

class AddLocalSheet extends StatefulWidget {
  const AddLocalSheet({
    super.key,
  });

  @override
  State<AddLocalSheet> createState() => _AddLocalSheetState();
}

class _AddLocalSheetState extends State<AddLocalSheet> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subTitle;
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomeTextFiled(
            onSaved: (value) {
              titel = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomeTextFiled(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 60,
          ),
          const ColorsLisView (),
          const SizedBox(
            height: 60,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomButton(
                  isLoading: state is AddNoteLoading? true:false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate=DateTime.now();
              
                      var formattedCurrenDate=DateFormat.yMd().format(currentDate);
                      var notemodel = NoteModel(
                          titel: titel!,
                          subTitle: subTitle!,
                          date: formattedCurrenDate,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                    } else {
                      autovalidateMode == AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

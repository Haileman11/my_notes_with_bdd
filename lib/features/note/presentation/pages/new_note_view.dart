import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';

import '../../domain/repositories/note_repository.dart';
import '../bloc/note_bloc.dart';
import 'package:my_notes/injection_container.dart' as di;

import '../widgets/note_form_widget.dart';

class NewNoteView extends StatefulWidget {
  const NewNoteView({Key? key}) : super(key: key);

  @override
  State<NewNoteView> createState() => _NewNoteViewState();
}

class _NewNoteViewState extends State<NewNoteView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _titleController = TextEditingController();
    var _contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new note"),
        actions: [
          IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final note = Note(
                      title: _titleController.text,
                      content: _contentController.text);
                  context.read<NoteBloc>().add(AddNoteEvent(note));
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Form(
        key: formKey,
        child: NoteForm(
            titleController: _titleController,
            contentController: _contentController),
      ),
    );
  }
}

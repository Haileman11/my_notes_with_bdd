import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';

import '../../domain/repositories/note_repository.dart';
import '../bloc/note_bloc.dart';
import 'package:my_notes/injection_container.dart' as di;

import '../widgets/note_form_widget.dart';

class NoteDetailsView extends StatefulWidget {
  final Note note;

  const NoteDetailsView({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var _titleController = TextEditingController(text: widget.note.title);
    var _contentController = TextEditingController(text: widget.note.content);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit note"),
        actions: [
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final note = Note(
                    title: _titleController.text,
                    content: _contentController.text);
                context.read<NoteBloc>().add(EditNoteEvent(note));
              }
            },
            icon: const Icon(Icons.save),
          ),
          IconButton(
            onPressed: () async {
              final confirmDelete = await _openConfirmationDialog();
              if (confirmDelete != null && confirmDelete == true) {
                if (!mounted) return;
                context.read<NoteBloc>().add(DeleteNoteEvent(widget.note));
              }
            },
            icon: const Icon(Icons.delete),
          ),
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

  Future<bool?> _openConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete the note?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}

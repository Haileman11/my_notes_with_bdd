import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/note_bloc.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({
    Key? key,
    required TextEditingController titleController,
    required TextEditingController contentController,
  })  : _titleController = titleController,
        _contentController = contentController,
        super(key: key);

  final TextEditingController _titleController;
  final TextEditingController _contentController;

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) {
          if (state.runtimeType == NoteLoading) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Saving"),
              duration: Duration(milliseconds: 10),
            ));
          }
          if (state.runtimeType == NoteLoaded) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Saved successfully"),
              duration: Duration(milliseconds: 10),
            ));
          }
          if (state.runtimeType == NoteError) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Error saving"),
              duration: Duration(milliseconds: 10),
            ));
          }
          if (state.runtimeType == NoteDeleted) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Note deleted"),
                duration: Duration(milliseconds: 10),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.runtimeType == NoteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Title"),
                controller: widget._titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title can not be empty";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Content"),
                controller: widget._contentController,
              )
            ],
          );
        },
      ),
    );
  }
}

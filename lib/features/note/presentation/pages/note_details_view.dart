import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';

import '../../domain/repositories/note_repository.dart';
import '../bloc/note_bloc.dart';
import 'package:my_notes/injection_container.dart' as di;

class NoteDetailsView extends StatefulWidget {
  final Note note;

  const NoteDetailsView({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  @override
  Widget build(BuildContext context) {
    var _controller;
    return BlocProvider(
      create: (context) => NoteBloc(noteRepository: di.sl<NoteRepository>()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.save)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Title"),
                controller: _controller,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Content"),
                controller: _controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}

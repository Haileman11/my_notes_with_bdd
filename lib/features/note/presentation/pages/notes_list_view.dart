import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notes_list_bloc.dart';

class NotesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/notes/note',
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocConsumer<NotesListBloc, NotesListState>(
        listener: (context, state) {
          if (state.runtimeType == NotesListLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Loaded")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case NotesListLoading:
              return const Center(child: CircularProgressIndicator());
            case NotesListLoaded:
              final noteListLoadedState = state as NotesListLoaded;
              final notes = noteListLoadedState.notesList;
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(notes[index].title),
                  onTap: () => Navigator.of(context)
                      .pushNamed('/notes/note', arguments: notes[index]),
                ),
              );
            case NotesListEmpty:
              return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2,
                child: Text('Add notes'),
              );
            default:
              state as NotesListError;
              return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2,
                child: Text(state.message),
              );
          }
        },
      ),
    );
  }
}

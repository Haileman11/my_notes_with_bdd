import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notes_list_bloc.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key("HOME"),
        title: Text("Notes"),
        actions: [
          IconButton(
              key: const Key("new_note"),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/notes/new_note',
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
          if (state.runtimeType == NotesListLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Loading")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case NotesListLoading:
              return const Center(
                  key: Key("loading"), child: CircularProgressIndicator());
            case NotesListLoaded:
              final noteListLoadedState = state as NotesListLoaded;
              final notes = noteListLoadedState.notesList;

              return ListView.builder(
                key: const Key("NOTES_LIST"),
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
                child: const Center(
                  key: Key("EMPTY"),
                  child: Text("You have no saved notes."),
                ),
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

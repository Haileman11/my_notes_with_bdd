import 'package:flutter/material.dart';

import '../../features/note/domain/entities/note.dart';
import '../../features/note/presentation/pages/new_note_view.dart';
import '../../features/note/presentation/pages/note_details_view.dart';
import '../../features/note/presentation/pages/notes_list_view.dart';

Route<dynamic> routeGenerator(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/notes':
      return MaterialPageRoute(builder: (_) {
        return const NotesListView();
      });
    case '/notes/new_note':
      return MaterialPageRoute(builder: (_) {
        return const NewNoteView();
      });
    case '/notes/note':
      final note = routeSettings.arguments as Note?;
      return MaterialPageRoute(builder: (_) {
        return NoteDetailsView(
            note: note ?? const Note(title: "", content: ""));
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Center(
          child: Text("Page not found"),
        );
      });
  }
}

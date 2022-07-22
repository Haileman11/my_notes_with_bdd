import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/core/utils/route_generator.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';
import 'package:my_notes/features/note/presentation/bloc/note_bloc.dart';
import 'package:my_notes/features/note/presentation/bloc/notes_list_bloc.dart';
import 'package:my_notes/features/note/presentation/pages/notes_list_view.dart';
import 'package:my_notes/injection_container.dart' as di;

class TestMyApp extends StatelessWidget {
  final String initialRoute;

  const TestMyApp({Key? key, required this.initialRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<NotesListBloc>()..add(GetNotesListEvent()),
          child: NotesListView(),
        ),
        BlocProvider(
            create: (context) =>
                NoteBloc(noteRepository: di.sl<NoteRepository>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: routeGenerator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

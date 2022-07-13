import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/presentation/pages/notes_list_view.dart';
import 'features/note/presentation/bloc/notes_list_bloc.dart';
import 'features/note/presentation/pages/note_details_view.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: '/notes',
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case '/notes':
            return MaterialPageRoute(builder: (_) {
              return BlocProvider(
                create: (context) => di.sl<NotesListBloc>(),
                child: NotesListView(),
              );
            });
          case '/notes/note':
            final note = routeSettings.arguments as Note?;
            return MaterialPageRoute(builder: (_) {
              return NoteDetailsView(
                  note: note ?? const Note(title: "", content: ""));
            });
          default:
            return null;
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

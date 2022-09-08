import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/presentation/pages/new_note_view.dart';
import 'package:my_notes/features/note/presentation/pages/notes_list_view.dart';
import 'package:user_repository/user_repository.dart';
import 'core/utils/route_generator.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/note/domain/repositories/note_repository.dart';
import 'features/note/presentation/bloc/note_bloc.dart';
import 'features/note/presentation/bloc/notes_list_bloc.dart';
import 'features/note/presentation/pages/note_details_view.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;
  MyApp({Key? key}) : super(key: key);

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
        BlocProvider(
            create: (context) => AuthenticationBloc(
                userRepository: di.sl<UserRepository>(),
                authenticationRepository: di.sl<AuthenticationRepository>())),
      ],
      child: MaterialApp(
        navigatorKey: _navigatorKey,
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
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushNamedAndRemoveUntil<void>(
                    '/notes',
                    (route) => false,
                  );
                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                    LoginPage.route(),
                    (route) => false,
                  );
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: routeGenerator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:authentication_repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';
import 'features/note/data/datasources/note_local_datasource.dart';
import 'features/note/data/repositories/note_repository_impl.dart';
import 'features/note/domain/repositories/note_repository.dart';
import 'features/note/presentation/bloc/note_bloc.dart';
import 'features/note/presentation/bloc/notes_list_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
  sl.registerSingleton<UserRepository>(UserRepository());
  // user bloc
  sl.registerFactory<NoteBloc>(() => NoteBloc(noteRepository: sl()));
  // user list bloc
  sl.registerFactory<NotesListBloc>(() => NotesListBloc(noteRepository: sl()));
  // usecase

  // repository
  sl.registerLazySingleton<NoteRepository>(
    () => NoteRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  // datasources
  sl.registerLazySingleton<NoteLocalDataSource>(
    () => NoteLocalDataSourceImpl(
      notesBox: sl(),
    ),
  );

  // core

  // external

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  final collection = await BoxCollection.open(
    'notes_db',
    {'notes'},
  );
  final notesBox = await collection.openBox<Map<dynamic, dynamic>>('notes');
  sl.registerLazySingleton(() => notesBox);
}

import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:my_notes/features/note/data/datasources/note_local_datasource.dart';
import 'package:my_notes/features/note/data/repositories/note_repository_impl.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';
import 'package:my_notes/features/note/presentation/bloc/note_bloc.dart';
import 'package:my_notes/features/note/presentation/bloc/notes_list_bloc.dart';
import 'package:my_notes/injection_container.dart';
@GenerateMocks([NoteLocalDataSource, NoteRepository])
import 'injection_helper.mocks.dart';

void setupInjection() async {
  // user bloc
  sl.registerFactory<NoteBloc>(() => NoteBloc(noteRepository: sl()));
  // user list bloc
  sl.registerFactory<NotesListBloc>(() => NotesListBloc(noteRepository: sl()));
  // usecase

  // repository
  sl.registerLazySingleton<NoteRepository>(() => MockNoteRepository());
  // datasources
  sl.registerLazySingleton<NoteLocalDataSource>(
      () => MockNoteLocalDataSource());

  // core
  // final collection = await BoxCollection.open(
  //   'notes_db',
  //   {'notes'},
  // );
  // final notesBox = await collection.openBox<Map<dynamic, dynamic>>('notes');
  // sl.registerLazySingleton(() => notesBox);
}

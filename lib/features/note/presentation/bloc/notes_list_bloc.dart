import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  final NoteRepository noteRepository;

  NotesListBloc({required this.noteRepository}) : super(NotesListEmpty()) {
    on<NotesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

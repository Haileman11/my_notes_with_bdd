import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';

import '../../../../core/error/failure.dart';

part 'notes_list_event.dart';
part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  final NoteRepository noteRepository;

  NotesListBloc({required this.noteRepository}) : super(NotesListLoading()) {
    on<GetNotesListEvent>(_onGetNotesEvent);
  }
  Future<void> _onGetNotesEvent(
      GetNotesListEvent event, Emitter<NotesListState> emitter) async {
    emitter(NotesListLoading());
    final resultEither = await noteRepository.getNotes();
    resultEither.fold((failure) {
      emitter(NotesListError(message: _mapFailureToMessage(failure)));
    }, (notesList) {
      if (notesList.isEmpty) {
        emitter(NotesListEmpty());
      } else {
        emitter(NotesListLoaded(notesList: notesList));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case CacheFailure:
        return 'Could not load notes';
      default:
        return 'Unexpected error';
    }
  }
}

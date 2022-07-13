import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;

  NoteBloc({required this.noteRepository}) : super(NoteInitial()) {
    on<NoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_notes/core/error/failure.dart';
import 'package:my_notes/features/note/domain/entities/note.dart';
import 'package:my_notes/features/note/domain/repositories/note_repository.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;

  NoteBloc({required this.noteRepository}) : super(NoteInitial()) {
    on<AddNoteEvent>(_onAddNoteEvent);
    on<EditNoteEvent>(_onEditNoteEvent);
    on<DeleteNoteEvent>(_onDeleteEvent);
  }
  Future<void> _onAddNoteEvent(
      AddNoteEvent event, Emitter<NoteState> emitter) async {
    emitter(NoteLoading());
    final resultEither = await noteRepository.addNote(event.note);
    resultEither.fold((failure) {
      emitter(NoteError(message: _mapFailureToMessage(failure)));
    }, (_) {
      emitter(NoteLoaded(note: event.note));
    });
  }

  Future<void> _onEditNoteEvent(
      EditNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    final resultEither = await noteRepository.editNote(event.note);
    resultEither.fold((failure) {
      emit(NoteError(message: _mapFailureToMessage(failure)));
    }, (_) {
      emit(NoteLoaded(note: event.note));
    });
  }

  Future<void> _onDeleteEvent(
      DeleteNoteEvent event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    final resultEither = await noteRepository.deleteNote(event.note);
    resultEither.fold((failure) {
      emit(NoteError(message: _mapFailureToMessage(failure)));
    }, (_) {
      // emit(NoteLoaded(note: event.note));
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case CacheFailure:
      return 'Could not save the note';
    default:
      return 'Unexpected error';
  }
}

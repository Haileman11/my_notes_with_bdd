part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {
  final Note note = const Note(content: "", title: "");
}

class NoteLoading extends NoteState {}

class NoteError extends NoteState {
  final String message;
  const NoteError(this.message);
}

class NoteLoaded extends NoteState {
  final Note note;
  const NoteLoaded(this.note);
}

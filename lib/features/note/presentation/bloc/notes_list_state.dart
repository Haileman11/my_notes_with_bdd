part of 'notes_list_bloc.dart';

abstract class NotesListState extends Equatable {
  const NotesListState();

  @override
  List<Object> get props => [];
}

class NotesListEmpty extends NotesListState {}

class NotesListLoading extends NotesListState {}

class NotesListError extends NotesListState {
  final String message;

  const NotesListError({required this.message});
}

class NotesListLoaded extends NotesListState {
  final List<Note> notesList;

  const NotesListLoaded({required this.notesList});
}

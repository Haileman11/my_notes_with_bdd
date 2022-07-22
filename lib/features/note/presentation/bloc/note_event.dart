part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetNote extends NoteEvent {
  final Note note;

  const GetNote(this.note);
}

class AddNoteEvent extends NoteEvent {
  final Note note;

  const AddNoteEvent(this.note);
}

class EditNoteEvent extends NoteEvent {
  final Note note;

  const EditNoteEvent(this.note);
}

class DeleteNoteEvent extends NoteEvent {
  final Note note;

  const DeleteNoteEvent(this.note);
}

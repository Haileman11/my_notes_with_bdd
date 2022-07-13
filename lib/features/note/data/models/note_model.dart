import 'package:my_notes/features/note/domain/entities/note.dart';

class NoteModel extends Note {
  const NoteModel({required super.title, required super.content});
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(title: json['title'], content: json['content']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }
}

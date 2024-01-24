
import 'package:demo_flutter_mvc/mvc/model/note_model.dart';

///
/// [NoteController]
///
class NoteController {

  late List<NoteModel> _noteList;

  NoteController() {
    _noteList = [];
  }

  List<NoteModel> getNoteList() {
    _noteList.sort((noteA, noteB) => noteB.id.compareTo(noteA.id)); // Descending Sort
    return _noteList;
  }

  void addNewNote(NoteModel newNote) {
    _noteList.add(newNote);
  }

  void remoteNote(int index) {
    _noteList.removeAt(index);
  }

  void updateNote(NoteModel updateNote) {
    int updatedIndex = _noteList.indexWhere((element) => element.id == updateNote.id);
    _noteList[updatedIndex] = updateNote;
  }

  int generateNoteId() {
    return _noteList.length + 1;
  }

  bool get isEmptyNote => _noteList.isEmpty;

}
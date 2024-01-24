
///
/// [NoteModel]
///
class NoteModel {

  int id;
  int userId;
  String description;
  DateTime createdDate;

  NoteModel(
    this.id,
    this.userId,
    this.description,
    this.createdDate,
  );

  String getDescriptionWithId() => '$id : $description';

}
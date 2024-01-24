
import 'package:demo_flutter_mvc/mvc/controller/note_controller.dart';
import 'package:demo_flutter_mvc/mvc/view/create_note_view.dart';
import 'package:flutter/material.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {

  final noteController = NoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note MVC Pattern'),
      ),
      body: noteController.isEmptyNote
        ? const Center(
          child: Text('Please add new note'),
        )
        : ListView(
          children: noteController.getNoteList().asMap().map((index, note) {
            return MapEntry(
              index, 
              ListTile(
                title: Text(note.createdDate.toString()),
                subtitle: Text(note.getDescriptionWithId()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      noteController.remoteNote(index);
                    });
                  },
                ),
              ),
            );
          }).values.toList(),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNoteView(noteController))).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
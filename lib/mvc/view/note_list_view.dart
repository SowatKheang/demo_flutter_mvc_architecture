
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
          padding: const EdgeInsets.only(top: 4),
          children: noteController.getNoteList().asMap().map((index, note) {
            return MapEntry(
              index, 
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  title: Text(note.createdDate.toString()),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      note.getDescriptionWithId(),
                      style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w700),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        noteController.remoteNote(index);
                      });
                    },
                  ),
                ),
              ),
            );
          }).values.toList(),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNoteView(noteController))).then((value) {
            setState(() {}); // callback to update the UI
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
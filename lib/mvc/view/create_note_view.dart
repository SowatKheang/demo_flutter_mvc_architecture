
import 'package:demo_flutter_mvc/mvc/controller/note_controller.dart';
import 'package:demo_flutter_mvc/mvc/model/note_model.dart';
import 'package:flutter/material.dart';

class CreateNoteView extends StatefulWidget {

  final NoteController noteController;
  const CreateNoteView(this.noteController, {super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {

  FocusNode focusNode = FocusNode();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Description :'),
          TextFormField(
            focusNode: focusNode,
            controller: descriptionController,
            maxLines: 5,
          ),
          const SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: () {
                NoteModel noteModel = NoteModel(
                  widget.noteController.generateNoteId(), 
                  1, 
                  descriptionController.text, 
                  DateTime.now(),
                );
                
                widget.noteController.addNewNote(noteModel);

                Navigator.pop(context);
              },
              child: const Text('Add New Note'),
            ),
          ),
        ],
      ),
    );
  }
}
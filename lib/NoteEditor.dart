import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteEditor extends StatefulWidget {
  final Function(String, String) createCardCallback;
  const NoteEditor({Key? key, required this.createCardCallback}) : super(key: key);

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {

  var time = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: (){
                  String title = titleController.text;
                  String text = textController.text;
                  widget.createCardCallback(title, text);
                  Navigator.pop(context);
                  print(title + text);
                },
                icon: Icon(Icons.check, color: Colors.white,)),
            //Icon(Icons.check, color: Colors.white,),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextField(
                controller: titleController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 25 ),

                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 17),
              child: SizedBox(
                child: Text('${DateFormat('dd MMMM h:mm a').format(time)}', style: TextStyle(fontSize: 12, color: Colors.white54),),
              ),
            ),
            Container(
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Start typing',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600 ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

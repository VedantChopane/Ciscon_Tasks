import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/NoteEditor.dart';
import 'MyCard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky Notes',
      theme: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme:
              InputDecorationTheme(labelStyle: TextStyle(color: Colors.white)),
          hintColor: Colors.white54),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var time = DateTime.now();
  List<MyCard> mycards = [];
  
  void _createCard(title, text) {
    //double Hei;
    //List<double> h = [100, 150, 120, 110, 140, 160];
    //Hei = h[Random().nextInt(h.length)];

    MyCard myCard = MyCard(hei: 100, wid: 100, text:text , title: title);
    mycards.add(myCard);


    setState(() {}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('Notes')),
        backgroundColor: Colors.black,
      ),
      body:
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 15.0, left: 11,right: 11),
                  child: Container(
                    height: 46,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade900,
                ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search notes',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white54,
                      )),
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: mycards.map((myCard) => InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor(createCardCallback: (title,text) { _createCard(title, text); },),));
                      },
                      child: myCard,
                    ),
                  )
                      .toList(),
                ),
              ),
        ],
      ),
          ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //_createCard();
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteEditor(createCardCallback: (title,text) { _createCard(title, text); },),));

        },
        label: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Color(0xFFFDBD01),
        shape: CircleBorder(),
      ),
    );

  }


}


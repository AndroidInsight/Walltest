import 'dart:convert';
import 'package:walltest/tabs/notes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:walltest/tabs/notes.dart';

import '../widgets.dart';


class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

List<Note> _notes = <Note>[];

  Future<List<Note>> fetchNotes() async {
    var url = 'https://raw.githubusercontent.com/AndroidInsight/Foster.json/main/Foster.json';
    var response = await http.get(url);
    var notes = <Note>[];

    if(response.statusCode == 200) {

      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
       notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }


  @override
  Widget build(BuildContext context) {
void initState() {
  fetchNotes().then((value) {
    setState(() {
      _notes.addAll(value);
    });
  }
  );
  super.initState();
}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(child: Container(
                  color: Colors.yellow,
                  child: Image.network(_notes[index].img),
                )),
              ],
            ),
          );
        },
        itemCount: _notes.length,
      ),

    );
  }
}


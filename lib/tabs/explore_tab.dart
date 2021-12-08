import 'dart:convert';
import 'package:walltest/tabs/notes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final List<Note> _notes = <Note>[];

  Future<List<Note>> fetchNotes() async {
    var url = Uri.parse(
        "https://raw.githubusercontent.com/AndroidInsight/Foster.json/main/Foster.json");

    final response = await http.get(url);
    final notes = <Note>[];

    if (response.statusCode == 200) {
      final notesJson = json.decode(response.body);
      for (final noteJson in notesJson) {
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
      });
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GridView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.red,
            elevation: 10,
            child: Center(

              child: Image.network(_notes[index].img),
            ),
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),

      ),
    );
  }
}

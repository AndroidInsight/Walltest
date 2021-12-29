import 'package:flutter/material.dart';
import 'package:walltest/models/wall_model.dart';
import 'package:walltest/services/walls_api.dart';
import 'package:walltest/views/walls.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper App'),
      ),
      body: FutureBuilder<List<WallModel>>(
        future: WallsApi.getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: [
                Walls(snapshotW: snapshot),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

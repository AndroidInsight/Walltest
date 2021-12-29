import 'package:flutter/material.dart';
import 'package:walltest/models/wall_model.dart';

class Walls extends StatelessWidget {
  final AsyncSnapshot<List<WallModel>> snapshotW;
  const Walls({Key? key, required this.snapshotW}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  snapshotW.data![index].thumbnailUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Row(),
            ],
          );
        });
  }
}

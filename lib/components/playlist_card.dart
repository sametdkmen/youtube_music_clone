import 'package:flutter/material.dart';
import 'package:youtube_music_app/model/playlist.dart';

class PlayListCard extends StatelessWidget {
  final PlayList model;

  const PlayListCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height / 2.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("images/${model.imageName}"),
            ),
          ),
          const SizedBox(
            height: 6.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.listName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Wrap(
                children: [
                  Text(
                    model.description,
                    style: const TextStyle(color: Colors.white60, fontSize: 10),
                  ),
                ], //Wrap ile sarmaladık alt satıra düzgün şekilde geçsin diye.
              ),
            ],
          ),
        ],
      ),
    );
  }
}

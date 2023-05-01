// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/desc_dialog.dart';
import 'package:netflix_clone/utils/loading_card.dart';

class MovieCard extends StatefulWidget {
  final String photo;
  final String name;
  final String year;
  final String desc;
  const MovieCard(
      {required this.photo,
      required this.name,
      required this.year,
      required this.desc});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5,
      ),
      child: InkWell(
        onTap: () {
          showGeneralDialog(
            context: context,
            barrierColor: Colors.black54,
            barrierDismissible: true,
            barrierLabel: 'Label',
            pageBuilder: (_, __, ___) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: DescDialog(
                  desc: widget.desc,
                  name: widget.name,
                  photo: widget.photo,
                  year: widget.year,
                ),
              );
            },
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: widget.photo == 'images/peaky.jpg'
              ? Image.asset(
                  widget.photo,
                  height: 150.0,
                  width: 100.0,
                  fit: BoxFit.fill,
                )
              : Image.network(
                  widget.photo,
                  height: 150.0,
                  width: 100.0,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return LoadingCard();
                  },
                ),
        ),
      ),
    );
  }
}

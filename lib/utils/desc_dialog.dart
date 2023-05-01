// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:netflix_clone/utils/desc_button.dart';
import 'package:netflix_clone/utils/loading_card.dart';

class DescDialog extends StatelessWidget {
  final String photo;
  final String name;
  final String desc;
  final String year;
  const DescDialog(
      {super.key,
      required this.photo,
      required this.name,
      required this.desc,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 280,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromRGBO(43, 43, 43, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: photo.contains('peaky')||photo.contains('stranger')
                        ? Image.asset(
                            photo,
                            height: 130,
                            width: 100,
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            photo,
                            height: 130,
                            width: 100,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return LoadingCard();
                            },
                          ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 230,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      name,
                                      style: GoogleFonts.workSans(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          year,
                                          style: GoogleFonts.workSans(
                                            fontSize: 10,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'A',
                                          style: GoogleFonts.workSans(
                                            fontSize: 10,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '7 Seasons',
                                          style: GoogleFonts.workSans(
                                            fontSize: 10,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(61, 61, 61, 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: 80,
                        width: 230,
                        // color: Colors.pink,
                        child: Text(
                          "When a bomb kills the President and other top politicians, demure Cabinet member Tom Kirkman must suddenly take the reins of a government in chaos",
                          // desc,
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.workSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    DescButton(icon: Icons.play_arrow, str: 'Play'),
                    DescButton(icon: Icons.download_rounded, str: 'Download'),
                    DescButton(icon: Icons.add, str: 'My List'),
                    DescButton(icon: Icons.share, str: 'Share'),
                  ],
                ),
              ),
              // Divider(
              //   thickness: 1,
              //   color: Colors.white,
              // ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.white.withOpacity(0.6),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    IconlyLight.info_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Info',
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

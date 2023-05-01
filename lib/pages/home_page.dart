// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_field, non_constant_identifier_names, unused_element, prefer_final_fields, unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:netflix_clone/pages/sign_in.dart';
import 'package:netflix_clone/pages/temp.dart';
import 'package:netflix_clone/utils/desc_dialog.dart';
import 'package:netflix_clone/utils/movie_card.dart';
import 'package:iconly/iconly.dart';
import 'package:netflix_clone/utils/titles_card.dart';
import 'package:netflix_clone/utils/upcoming_card.dart';
// import 'package:http/http.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scroll = ScrollController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  double kOpa = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.black.withOpacity(kOpa),
        // backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 35,
              width: 35,
              child: Image.asset('images/netflix.png'),
            ),
            Row(
              children: [
                Icon(
                  IconlyLight.search,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  // overlayColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await _auth.signOut();
                    await _googleSignIn.signOut();
                    Navigator.pushNamed(context, SignIn.id);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'images/test.jpg',
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (noti) {
          setState(() {
            if (_scroll.offset < 300) {
              kOpa = _scroll.offset / 400;
            } else {
              kOpa = 0.75;
            }
          });
          return true;
        },
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          controller: _scroll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
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
                          desc: '',
                          name: 'Stranger Things',
                          photo: 'images/stranger.jpg',
                          year: '2016',
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 550,
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Image.asset('images/stranger.jpg'),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'My List',
                                  style: GoogleFonts.workSans(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      size: 35,
                                    ),
                                    Text(
                                      'Play',
                                      style: GoogleFonts.workSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Icon(
                                  IconlyLight.info_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Info',
                                  style: GoogleFonts.workSans(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TitlesCard(),
              SizedBox(
                height: 5,
              ),
              UpcomingCard(),
              SizedBox(
                height: 5,
              ),
              TitlesCard(),
              SizedBox(
                height: 5,
              ),
              UpcomingCard(),
              SizedBox(
                height: 5,
              ),
              TitlesCard(),
              SizedBox(
                height: 5,
              ),
              UpcomingCard(),
              SizedBox(
                height: 5,
              ),
              UpcomingCard(),
              SizedBox(
                height: 5,
              ),
              UpcomingCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 10,
        selectedFontSize: 10,
        iconSize: 20,
        showUnselectedLabels: true,
        // enableFeedback: false,
        backgroundColor: Color.fromARGB(255, 32, 32, 32),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconlyBold.home,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.game,
              color: Colors.white,
            ),
            label: 'Games',
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.chart,
              color: Colors.white,
            ),
            label: 'New and Hot',
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconlyLight.download,
              color: Colors.white,
            ),
            label: 'Downloads',
            backgroundColor: Color.fromARGB(255, 32, 32, 32),
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
      ),
    );
  }
}

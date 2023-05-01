// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/provider/upcoming_provider.dart';
import 'package:netflix_clone/utils/movie_card.dart';

class Temp extends ConsumerWidget {
  static String id = 'temp';
  const Temp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(upcomingDataProvider);
    return Scaffold(
      body: counter.when(
        data: (counter) {
          print('here');
          return Container(
            height: 200,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  Upcoming',
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return MovieCard(photo: 'images/peaky.jpg', desc: '', name: '', year: '',);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => Center(
          child: CircularProgressIndicator(
            strokeWidth: 10,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

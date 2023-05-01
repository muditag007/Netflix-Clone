// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, unrelated_type_equality_checks, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/upcoming.dart';
import 'package:netflix_clone/provider/upcoming_provider.dart';
import 'package:netflix_clone/utils/loading_card.dart';
import 'package:netflix_clone/utils/movie_card.dart';

class UpcomingCard extends ConsumerWidget {
  const UpcomingCard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(upcomingDataProvider);

    return counter.when(
      data: (counter) {
        return Container(
          height: 200,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Upcoming',
                  style: GoogleFonts.workSans(
                    fontSize: 22,
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
                    itemCount: counter.results!.length,
                    itemBuilder: (context, index) {
                      List<Results>? upcom = counter.results;
                      // for (int i = 0; i < upcom!.length; i++) {
                      //   print(upcom[i].titleText!.text);
                      // }
                      if (upcom![index].primaryImage.toString() != 'null') {
                        return MovieCard(
                          photo: upcom[index].primaryImage!.url.toString(),
                          desc: '',
                          name: upcom[index].titleText!.text.toString(),
                          year: upcom[index].releaseYear!.year.toString(),
                        );
                      } else {
                        return MovieCard(
                          photo: 'images/peaky.jpg',
                          desc: '',
                          name: upcom[index].titleText!.text.toString(),
                          year: upcom[index].releaseYear!.year.toString(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (err, s) => Text(
        err.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      loading: () => Container(
        height: 200,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Popular',
                style: GoogleFonts.workSans(
                  fontSize: 22,
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
                    return LoadingCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

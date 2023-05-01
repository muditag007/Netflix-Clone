import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/models/upcoming.dart';
import 'package:netflix_clone/services/services.dart';

final upcomingDataProvider = FutureProvider<Upcoming>((ref) async {
  return ref.watch(upcomingProvider).getInfo();
});


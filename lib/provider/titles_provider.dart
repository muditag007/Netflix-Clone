import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_clone/models/titles.dart';
import 'package:netflix_clone/services/services.dart';

final titlesDataProvider = FutureProvider<Titles>((ref) async {
  return ref.watch(titlesProvider).getInfo();
});


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/screens/providers/movies/movies_providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  
  if(nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0,6);
}); 
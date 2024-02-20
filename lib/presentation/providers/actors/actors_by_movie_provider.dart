import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/actor.dart';


final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  return ActorsByMovieNotifier(
    getActorsByMovie: ref.watch(actorsRepositoryProvider).getActorsByMovie,
  );
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActorsByMovie;
  ActorsByMovieNotifier({
    required this.getActorsByMovie,
  }) : super({});

  Future<void> getActorsByMovieNotifier(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActorsByMovie(movieId);

    state = {
      ...state,
      movieId: actors,
    };
  }
}
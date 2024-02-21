import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


typedef SearchMoviesCallback = Future<List<Movie>>Function(String query); 
class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMoviesCallback;
  SearchMovieDelegate({required this.searchMoviesCallback}); 
  

  @override
  String get searchFieldLabel => 'Buscar película';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
        FadeIn(
          animate: query.isNotEmpty,
          duration: const Duration(milliseconds: 200),
          child: IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear),
          ),
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMoviesCallback(query),
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data as List<Movie>;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movies[index].title),
              onTap: () => close(context, movies[index]),
            ); 
          },
        ); 
      },
    ); 
  }
}
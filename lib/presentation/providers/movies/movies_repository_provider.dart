import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repositorio inmutable de la fuente de datos de las películas
final movieRepositoryProvider =
    Provider((ref) => MoviesRepositoryImpl(MovieDbDataSource()));

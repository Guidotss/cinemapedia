import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No key found!';
}
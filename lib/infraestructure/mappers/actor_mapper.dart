import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    character: cast.character,
    profilePath: (cast.profilePath != null) 
      ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
      : 'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-541.jpg?size=338&ext=jpg&ga=GA1.1.1700460183.1708473600&semt=ais'
  ); 
}
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository{

  Future<Movie> getNowPaling({int page=1});

}
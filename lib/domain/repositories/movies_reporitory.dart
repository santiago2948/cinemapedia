import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository{

  Future<List<Movie>> getNowPalying({int page=1});

}
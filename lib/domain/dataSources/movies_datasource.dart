import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource{

  Future<List<Movie>> getNowPalying({int page=1});

}
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDatasource{

  Future<Movie> getNowPaling({int page=1});

}
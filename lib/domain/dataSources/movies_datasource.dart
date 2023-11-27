import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource{

  Future<List<Movie>> getNowPaling({int page=1});

}
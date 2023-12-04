import 'package:cinemapedia/domain/dataSources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_reporitory.dart';

class MovieRepositoryImpl extends MoviesRepository{
  final MoviesDatasource datasource;

  MovieRepositoryImpl({required this.datasource});
  @override
  Future<List<Movie>> getNowPalying({int page = 1}) {
    return datasource.getNowPalying(page: page);
  }

}
import 'package:cinemapedia/domain/dataSources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_reporitory.dart';

class MovieRepositoryImpl extends MoviesRepository{
  final MoviesDatasource datasource;

  MovieRepositoryImpl({required this.datasource});
  @override
  Future<List<Movie>> getNowPalying({int page = 1}) {
    return datasource.getNowPalying(page: page) ;
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    
    return datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
   
   return datasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    
    return datasource.getUpcoming(page: page);
  }

}
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/dataSources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviebd/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviesdbDatasource extends MoviesDatasource{
  final dio = Dio(
      // en Base options se agregan los parametros de base, aquellos que nunca van a cambiar en nuestras peticiones
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3', // en este caso la url de la peticion siempre va a comenzar asi
        // aqui van nuestros parametros de consula, almenos los que no cambian como nuestra api key entre otras cosas
        queryParameters: {
           'api_key': Environment.moviedbKey,
           'language': 'es-MX'
        }
        )
      );
  
  @override
  Future<List<Movie>> getNowPalying({int page = 1}) async{
    final response = await dio.get('/movie/now_playing');

    final movieDbResponse=MoviedbResponse.fromJson(response.data);

    final List<Movie> movies= movieDbResponse.MovieMoviedbs
    .where((moviedb) => moviedb.posterPath!="no-poster")
    .map(
        (element) => MovieMapper.movieDBToEntity(element)
      ).toList();
    return movies;

  }

}
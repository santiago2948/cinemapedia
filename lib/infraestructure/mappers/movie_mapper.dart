import 'package:cinemapedia/infraestructure/models/moviebd/movie_moviebd.dart';
import '../../domain/entities/movie.dart';

class MovieMapper{

  static Movie movieDBToEntity(MovieMoviedb moviedb)=> Movie(
    adult: moviedb.adult, 
    backdropPath: (moviedb.backdropPath!= "") ? 
    "https://image.tmdb.org/t/p/w500${moviedb.backdropPath}"
    :"https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg", 
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(), 
    id: moviedb.id, 
    originalLanguage: moviedb.originalLanguage, 
    originalTitle: moviedb.originalTitle, 
    overview: moviedb.overview, 
    popularity: moviedb.popularity, 
    posterPath: (moviedb.posterPath!="")?
    "https://image.tmdb.org/t/p/w500${moviedb.backdropPath}"
    :"no-poster", 
    releaseDate: moviedb.releaseDate,
    title: moviedb.title, 
    video: moviedb.video, 
    voteAverage: moviedb.voteAverage, 
    voteCount: moviedb.voteCount
    );

}
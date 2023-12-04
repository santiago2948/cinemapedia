import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider= StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  final fetchMoreMovies= ref.watch( movieRepositoryProvider).getNowPalying;//se optienen la funcion del tipo que se definio posteriormente
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies//se envia la 
  );
});
//se define el tipo de la funcion o dat que se va a recibir unicamente
typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage=0;
    MovieCallBack fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}): super([]);


  Future<void> loadNextPage() async{

    currentPage++;

    final List<Movie> movies= await fetchMoreMovies(page: currentPage);

    state= [...state, ...movies];
    //state <----
  }
}
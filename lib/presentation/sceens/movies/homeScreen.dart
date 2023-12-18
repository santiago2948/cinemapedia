
// ignore_for_file: file_names

import 'package:cinemapedia/config/constants/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';


class HomeScreen extends ConsumerStatefulWidget {
  static const name= "home-screen";

  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now =DateTime.now();

    final nowPlayingMovies= ref.watch(nowPlayingMoviesProvider);
    final popularMovies= ref.watch(popularMoviesProvider);
    final upcoming= ref.watch(upComingMoviesProvider);
    final topRated= ref.watch(topRatedMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigation(),
        body: CustomScrollView(
          slivers:[
            const SliverAppBar(
              centerTitle: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppBar(),
                titlePadding: EdgeInsets.zero,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
            children: [
              MoviesSlideShow(movies: moviesSlideshow),
              MovieHorizontalListView(
                movies: nowPlayingMovies,
                title: "En cines",
                subTitle: "${dayOfWeek[now.weekday-1]} ${now.day}",
                loadNextPage: (){
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                movies: upcoming,
                title: "Proximamente",
                subTitle: "Mes de ${mountOfYear[now.month]}",
                loadNextPage: (){
                  ref.read(upComingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                movies: popularMovies,
                title: "Populares",
                //subTitle: "En este mes",
                loadNextPage: (){
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),MovieHorizontalListView(
                movies: topRated,
                title: "Mejor calificadas",
                subTitle: "Desde siempre",
                loadNextPage: (){
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ), const SizedBox(height: 50,)
              ]
            );
                  
                },
                childCount: 1
              )
            )
          ]
        ),
    );
  }
}


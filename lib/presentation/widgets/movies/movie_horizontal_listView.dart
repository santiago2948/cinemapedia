// ignore_for_file: file_names, unused_element

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const MovieHorizontalListView({super.key, required this.movies, this.title, this.subTitle, this.loadNextPage});

  @override
  State<MovieHorizontalListView> createState() => _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();
  @override
  void initState(){
      super.initState();
      scrollController.addListener(() {
        if (widget.loadNextPage==null) return;

        if(scrollController.position.pixels >= scrollController.position.maxScrollExtent){
          widget.loadNextPage!();
        }
      });
  }

  @override
  void dispose() {
    scrollController.dispose(); //siempre que se llame un listener se debe llamar el dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if(widget.title!=null || widget.subTitle!=null)
          _Title(title: widget.title, subtitle: widget.subTitle,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index]);
              },
              )
            )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles= Theme.of(context).textTheme;
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width:  150,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress !=null){
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Center( child: CircularProgressIndicator(strokeWidth: 2,),)
                      );
                  }

                  return FadeIn(child: child);
                },
                ),
              
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
              ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                Text('${movie.voteAverage}  ', style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800),),
                const Spacer(),
                Text(HumanFormats.number(movie.popularity), style: textStyles.bodySmall,)
              ]
              ,),
          )
          ]
        ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final tltleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title!=null)
          Text(title!, style: tltleStyle),
          const Spacer(),
          if(subtitle!=null)
         FilledButton.tonal(
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact
          ),
          onPressed: (){}, 
          child: Text(subtitle!)
          )
        ],
      ),
    );
  }
}
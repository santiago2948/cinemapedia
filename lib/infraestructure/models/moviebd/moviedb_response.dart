// To parse this JSON data, do
//
//     final moviedbResponse = moviedbResponseFromJson(jsonString);
// se crea esta clase que modela nuestras respuestas http para convertirlas en datos mas manejables
import 'package:cinemapedia/infraestructure/models/moviebd/movie_moviebd.dart';

class MoviedbResponse {
    final Dates? dates;
    final int page;
    final List<MovieMoviedb> MovieMoviedbs;
    final int totalPages;
    final int totalMovieMoviedbs;

    MoviedbResponse({
        required this.dates,
        required this.page,
        required this.MovieMoviedbs,
        required this.totalPages,
        required this.totalMovieMoviedbs,
    });

    factory MoviedbResponse.fromJson(Map<String, dynamic> json) => MoviedbResponse(
        dates: json["dates"]!=null? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        MovieMoviedbs: List<MovieMoviedb>.from(json["results"].map((x) => MovieMoviedb.fromJson(x))),
        totalPages: json["total_pages"],
        totalMovieMoviedbs: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates==null ? null : dates!.toJson(),
        "page": page,
        "MovieMoviedbs": List<dynamic>.from(MovieMoviedbs.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_MovieMoviedbs": totalMovieMoviedbs,
    };
}

class Dates {
    final DateTime maximum;
    final DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

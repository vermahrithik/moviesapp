
class MovieDetailModel {
  bool? adult;
  String? backdrop_path;
  int? budget;
  List<dynamic>? genres;
  String? homepage;
  int? id;
  String? title;
  String? overview;
  double? popularity;
  String? poster_path;
  List<dynamic>? production_companies;
  String? release_date;
  int? revenue;
  String? status;
  String? tagline;

  MovieDetailModel({
    required this.adult,
    required this.backdrop_path,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.release_date,
    required this.revenue,
    required this.status,
    required this.tagline,

  });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    budget = json['budget'];
    genres = json['genres'];
    homepage = json['homepage'];
    id = json['id'];
    title = json['title'];
    overview = json['overview'];
    popularity = json['popularity'];
    poster_path = json['poster_path'];
    production_companies = json['production_companies'];
    release_date = json['release_date'];
    revenue = json['revenue'];
    status = json['status'];
    tagline = json['tagline'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult as bool;
    data['backdrop_path'] = this.backdrop_path;
    data['budget'] = this.budget as int;
    data['genres'] = this.genres;
    data['homepage'] = this.homepage;
    data['id'] = this.id as int;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity as double;
    data['poster_path'] = this.poster_path;
    data['production_companies'] = this.production_companies;
    data['release_date'] = this.release_date;
    data['revenue'] = this.revenue as int;
    data['status'] = this.status;
    data['tagline'] = this.tagline;

    return data;
  }
}
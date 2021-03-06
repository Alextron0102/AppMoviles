class Movie {
  double popularity;
  String posterPath;
  int id;
  String title;
  String overview;
  String releaseDate;

  Movie(
      {this.popularity,
      this.posterPath,
      this.id,
      this.title,
      this.overview,
      this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    id = json['id'];
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
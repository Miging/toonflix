class WebtoonMedel {
  final String title, thumb, id;

  WebtoonMedel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

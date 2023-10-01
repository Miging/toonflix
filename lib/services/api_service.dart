import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonMedel>> getTodaysToons() async {
    List<WebtoonMedel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    //비동기하려면? await(async 필요)
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonMedel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      webtoonInstances.addAll(webtoons.map(($0) => WebtoonModel.fromJson($0)));
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatesEpisodesById(
      String id) async {
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await get(url);

    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      final episodesInstances = episodes
          .map((episode) => WebtoonEpisodeModel.fromJson(episode))
          .toList();

      return episodesInstances;
    }
    throw Error();
  }
}

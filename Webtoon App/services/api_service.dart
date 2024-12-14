import 'package:http/http.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    print("뭔데???");
    final url = Uri.parse('$baseUrl/$today');
    final response = await get(url);
    print("URL : $url");
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    print("Error?");
    throw Error();
  }
}

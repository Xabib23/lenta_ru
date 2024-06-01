
import 'package:http/http.dart' as http;
import 'package:dart_rss/dart_rss.dart';

abstract final class Api {
  // https://lenta.ru/rss

  static Future<RssFeed?> getNewst() async {
    try {
      final http.Response response =
          await http.get(Uri.parse('https://lenta.ru/rss'));
      RssFeed data = RssFeed.parse(response.body);
      return data;
    } catch (e) {
      e;
    }
  }

}

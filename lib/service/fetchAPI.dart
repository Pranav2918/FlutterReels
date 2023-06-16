import 'dart:convert';

import '../model/reel_model.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<Hits>> fetchReels() async {
    String url =
        "https://pixabay.com/api/videos/?key=32415825-5fa62ce69fc37f8d4760ede43";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      List<Hits> data = (decodeJson['hits'] as List<dynamic>)
          .map((e) => Hits.fromJson(e))
          .toList();
      print("DATA => $data");
      List<Hits> reels = data;
      return reels;
    } else {
      throw Exception("Failed to fetch API");
    }
  }
}

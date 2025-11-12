import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_model.dart';

class AnimeService {
  static const String baseUrl = "https://api.jikan.moe/v4/anime";

  Future<AnimeModel> fetchAnime() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return AnimeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load anime');
    }
  }

  Future<AnimeModel> searchAnime(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$query'));
    if (response.statusCode == 200) {
      return AnimeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to search anime');
    }
  }

  Future<AnimeModel> fetchAnimeByGenre(String genreId) async {
    final response = await http.get(
      Uri.parse('https://api.jikan.moe/v4/anime?genres=$genreId'),
    );

    if (response.statusCode == 200) {
      return AnimeModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load anime by genre');
    }
  }

  /// 🔹 Tambahan: ambil saran judul anime (autocomplete)
  Future<List<String>> searchAnimeSuggestions(String query) async {
    if (query.isEmpty) return [];
    final response = await http.get(Uri.parse('$baseUrl?q=$query&limit=5'));
    if (response.statusCode == 200) {
      final data = AnimeModel.fromJson(jsonDecode(response.body));
      return data.data!
          .map((anime) => anime.title ?? "")
          .where((title) => title.isNotEmpty)
          .toList();
    } else {
      throw Exception('Failed to get suggestions');
    }
  }
}

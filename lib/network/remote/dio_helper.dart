import 'package:dio/dio.dart';

import '../../models/album_model.dart';

class AlbumService {
  final Dio _dio = Dio();

  Future<List<Album>> fetchAlbums() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/albums');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      print("helllllo+$data");
      return data.map((album) => Album.fromJson(album)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}

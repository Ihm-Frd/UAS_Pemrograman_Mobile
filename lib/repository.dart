

//ini dh jadi
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_uas_tampilkan_api/model.dart';

class Repository {
  final _baseUrl =
      'https://al-quran-8d642.firebaseio.com/surat/1.json?print=pretty';

  Future<List<Blog>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Blog> blogs = data.map((e) => Blog.fromJson(e)).toList();
        return blogs;
      }
    }
    // catch (e) {
    //   print(e.toString());
    // }
    catch (e) {
      print('XMLHttpRequest Error: $e');
    }

    return []; // Kembaliin list kosong klo ada kesalahan
  }
}

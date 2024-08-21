import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices{
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> postData()
  async {
    final response = await http.get(Uri.parse('$baseUrl/posts')); // json

    print(response.statusCode);

    if(response.statusCode == 200 || response.statusCode==201)
      {
        final responsebody = jsonDecode(response.body);

        print(responsebody[0]["title"]);
        return jsonDecode(response.body); // json => object
      }else{
      throw Exception("failed to load posts");
    }
  }
  Future<List<dynamic>> getPhotos()
  async {
    final response = await http.get(Uri.parse('$baseUrl/photos')); // json

    print(response.statusCode);

    if(response.statusCode == 200 || response.statusCode==201)
      {
        final responsebody = jsonDecode(response.body);

        print(responsebody[0]["title"]);
        return jsonDecode(response.body); // json => object
      }else{
      throw Exception("failed to load posts");
    }
  }
}
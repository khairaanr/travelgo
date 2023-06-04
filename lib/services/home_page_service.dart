import 'dart:convert';

import '../models/package_model.dart';
import 'package:http/http.dart' as http;

class HomePageService {
  Future<List<Package>> getTravelPackage() async {
    final res =
        await http.get(Uri.parse('http://192.168.0.194:8000/api/packages'));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var parsed = data['items'].cast<Map<String, dynamic>>();
      return parsed
          .map<Package>((json) => Package.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed');
    }
  }
}

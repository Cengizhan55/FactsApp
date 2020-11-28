import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:number_facts/core/facts.dart';

class FactsResponseService {
  final String FACTS_URL = "http://numbersapi.com";

  Future<Facts> getData() async {
    final response = await http.get("$FACTS_URL/random?json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body) as Map;
        Facts _user = Facts.fromJson(jsonModel);
        return _user;
      default:
        return Future.error(response.statusCode.toString());
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

updateApi(String route, data) async {
  return await http.put(
    Uri.parse(route),
    headers: {"Content-Type" : "application/json"},
    body: data,
  );
}
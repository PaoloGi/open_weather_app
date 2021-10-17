import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "api.openweathermap.org";
const API = "/data/2.5";
const API_KEY = "";

class NetworkUtil {
  static Future<dynamic> get({required Uri url, Map<String, String>? oHeaders}) async {
    final Response response = await http.get(url, headers: oHeaders);
    final String res = response.body;
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      throw new Exception("Error while fetching data " + statusCode.toString());
    }
    return json.decode(res);
  }
}
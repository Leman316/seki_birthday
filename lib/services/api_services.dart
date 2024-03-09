import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../consts/consts.dart';
import '/utils/helpers.dart';

class ApiService {
  static final http.Client _client = http.Client();

  ApiService() {
    dd('ApiService Init');
  }

  static Future<http.Response> get(
    String url, {
    Map<String, String> headers = const {},
  }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      Uri uri = Uri.parse(url);

      headers['Content-Type'] = 'application/json; charset=UTF-8';
      var response = await _client.get(
        uri,
        headers: headers,
      );
      return response;
    } else {
      throw Exception('No internet connection please try again!');
    }
  }

  static Future<http.Response> post(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> body = const {},
  }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      Uri uri = Uri.parse(url);

      headers['Content-Type'] = 'application/json; charset=UTF-8';
      var response = await _client.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      return response;
    } else {
      throw Exception('No internet connection please try again!');
    }
  }

  static Future<http.StreamedResponse> multipart(
    String url, {
    Map<String, String> headers = const {},
    required File file,
  }) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      Uri uri = Uri.parse(url);

      headers['Content-Type'] = 'application/json; charset=UTF-8';
      var request = http.MultipartRequest(
        'POST',
        uri,
      );

      request.fields["api_key"] = AppConsts.apiKey;

      request.files.add(
        await http.MultipartFile.fromPath('image', file.path),
      );
      request.headers.addAll(headers);
      var response = await request.send();
      return response;
    } else {
      throw Exception('No internet connection please try again!');
    }
  }
}

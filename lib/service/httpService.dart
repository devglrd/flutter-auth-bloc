import 'dart:convert';
import 'dart:io';

import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  makeGetRequest(String url) async {
    // make GET request
    var response = await get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode == 401) {
      return false;
    }
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    return json;
    // TODO convert json to object...
  }

  makePostRequest(String url, data) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(data)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }
}

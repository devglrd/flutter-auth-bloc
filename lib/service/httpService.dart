import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

class HttpService {

  final String baseApi = "http://glrd.me:3000/api/";

  makeGetRequest(String url, {auth, token}) async {
    // make GET request
    var response;
    if (auth) {
      response = await get(
        url,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
    } else {
      response = await get(url);
    }
    
    // sample info available in response
    int statusCode = response.statusCode;
    String json = response.body;
    return json;
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

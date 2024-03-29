import 'package:auth/service/httpService.dart';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends HttpService {
  auth() async {
    final storage = new FlutterSecureStorage();
    var jwt = await storage.read(key: "jwt");

    var res = await this
        .makeGetRequest('${this.baseApi}auth/me', auth: true, token: jwt);
    var decode = jsonDecode(res);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        return false;
      }
    }
    return decode;
  }

  login(data) async {
    var res = await this.makePostRequest("${this.baseApi}auth/login", data);

    var decode = jsonDecode(res);
    print(decode);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        return decode;
      }
    }
    return decode;
  }

  register(data) async {
    var res = await this.makePostRequest("${this.baseApi}auth/register", data);

    var decode = jsonDecode(res);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        //TODO HANDLE ERROR
        return decode;
      }
    }
    return decode;
  }
}

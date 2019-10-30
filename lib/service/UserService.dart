import 'package:auth/service/httpService.dart';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService extends HttpService {
  index() async {
    final storage = new FlutterSecureStorage();
    var jwt = await storage.read(key: "jwt");

    var res = await this
        .makeGetRequest("${this.baseApi}users", auth: true, token: jwt);
    var decode = jsonDecode(res);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        return false;
      }
    }
    return decode;
  }
}

import 'package:auth/service/httpService.dart';
import 'dart:convert';

class AuthService extends HttpService {
  auth() async {
    var res = await this.makeGetRequest("http://127.0.0.1:3000/api/auth/me");
    if (!res) {
      return false;
    }
    return json.decode(res);
  }

  login(data) async {
    var res = await this
        .makePostRequest("http://127.0.0.1:3000/api/auth/login", data);

    var decode = jsonDecode(res);
    if (decode.containsKey('statusCode')) {
      if (decode["statusCode"] != 200) {
        print("ERROR");
        return decode;
      }
    }
    return decode;
  }
}

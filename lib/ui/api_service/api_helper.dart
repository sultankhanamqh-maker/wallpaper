import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../domain/api_exception.dart';

class ApiHelper{

  dynamic getApi({
    required String url,
  }) async {
    try {
      var res = await http.get(Uri.parse(url),headers: {
        "Authorization" : "nTN6LLaPAXypYxjkrlC6AmuCR7Lr5RA4CtCFDSOuvVfWJ0CvKgVaiJuJ",
      });
      return reResponse(res);
    } on SocketException catch (e) {
      throw NoInternetException(msg: e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
dynamic reResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      {
        var data = jsonDecode(response.body);
        return data;
      }
    case 400:
      {
        throw BadRequestException(
          msg: "With Status Code ${response.statusCode}",
        );
      }
    case 401:
      {
        throw UnauthorizedException(
          msg: "With Status Code ${response.statusCode}",
        );
      }
    case 404:
      {
        throw NotFoundException(
          msg: "With Status Code  ${response.statusCode}",
        );
      }
    case 500:
    default:
      {
        throw ServerException(msg: "With Status Code ${response.statusCode}");
      }
  }
}
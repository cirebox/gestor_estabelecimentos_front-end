import 'package:vaibestabelecimento/shared/global.dart';
import 'package:vaibestabelecimento/shared/restclient.dart';
import 'package:get/get.dart';

const urlBase = urlWS;

class LoginRepository {
  final RestClient api;

  LoginRepository({required this.api});

  Future<Response> auth(Map data) async {
    return await this.api.post(
          urlBase + '/auth',
          data,
        );
  }
}

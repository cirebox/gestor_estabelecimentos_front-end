import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:vaibestabelecimento/shared/global.dart';
import 'package:vaibestabelecimento/shared/restclient.dart';
import 'package:get/get.dart';

import '../model/model.dart';

const urlBase = urlWS;

class UsuarioRepository {
  final RestClient api;

  UsuarioRepository({required this.api});

  Future<List<UsuarioModel>> getAll(Map data) async {
    final _header = await criaHeader();
    final response = await this.api.get(
      urlBase + '/usuario', //'/listar',
      headers: _header,
      decoder: (body) {
        final retorno = body["data"];
        if (retorno is List) {
          return retorno
              .map<UsuarioModel>((json) => UsuarioModel.fromJson(json))
              .toList();
        }
        return null;
      },
    );
    if (response.hasError) {
      throw Exception('Erro ao listar usuários');
    }
    return response.body!;
  }

  Future<Response> delete(String id) async {
    final _header = await criaHeader();
    return await this.api.delete(urlBase + '/usuario/${id}', headers: _header);
  }

  Future<Response> add(Map data) async {
    final _header = await criaHeader();
    return await this.api.post(urlBase + '/signup/', data, headers: _header);
  }

  Future<Response> edit(Map data) async {
    final _header = await criaHeader();
    return await this.api.put(urlBase + '/usuario', data, headers: _header);
  }
}

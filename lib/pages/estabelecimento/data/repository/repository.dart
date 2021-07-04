import 'dart:html';

import 'package:vaibestabelecimento/pages/estabelecimento/data/model/cepmodel.dart';
import 'package:vaibestabelecimento/shared/funcoes.dart';
import 'package:vaibestabelecimento/shared/global.dart';
import 'package:vaibestabelecimento/shared/restclient.dart';
import 'package:get/get.dart';

import '../model/model.dart';

const urlBase = urlWS;

class EstabelecimentoRepository {
  final RestClient api;

  EstabelecimentoRepository({required this.api});

  Future<List<EstabelecimentoModel>> getAll(Map data) async {
    final _header = await criaHeader();
    final response = await this.api.get(
      urlBase + '/estabelecimento',
      headers: _header,
      decoder: (body) {
        final retorno = body["data"];
        if (retorno is List) {
          return retorno
              .map<EstabelecimentoModel>(
                  (json) => EstabelecimentoModel.fromJson(json))
              .toList();
        }
        return null;
      },
    );
    if (response.hasError) {
      throw Exception('Erro ao listar estabelecimentos');
    }
    return response.body!;
  }

  Future<CepModel> getCep(String cep) async {
    final response = await this.api.get(
      'https://viacep.com.br/ws/' + cep + '/json/',
      decoder: (body) {
        print(body);
        if (body != null) {
          return CepModel.fromJson(body);
        }
        return null;
      },
    );
    if (response.hasError) {
      throw Exception('Erro ao listar cep');
    }
    return response.body!;
  }

  Future<Response> delete(String id) async {
    final _header = await criaHeader();
    return await this
        .api
        .delete(urlBase + '/estabelecimento/' + id, headers: _header);
  }

  Future<Response> add(Map data) async {
    final _header = await criaHeader();
    return await this
        .api
        .post(urlBase + '/estabelecimento', data, headers: _header);
  }

  Future<Response> edit(Map data) async {
    final _header = await criaHeader();
    return await this
        .api
        .put(urlBase + '/estabelecimento/', data, headers: _header);
  }
}

class EstabelecimentoModel {
  String? id;
  String? nome;
  String? cnpj;
  String? telefone;
  String? email;
  String? cep;
  String? uf;
  String? cidade;
  String? bairro;
  String? logradouro;
  String? numero;
  String? complemento;
  String? createdAt;
  String? updatedAt;

  EstabelecimentoModel(
      {this.id,
      this.nome,
      this.cnpj,
      this.telefone,
      this.email,
      this.cep,
      this.uf,
      this.cidade,
      this.bairro,
      this.logradouro,
      this.numero,
      this.complemento,
      this.createdAt,
      this.updatedAt});

  EstabelecimentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cnpj = json['cnpj'];
    telefone = json['telefone'];
    email = json['email'];
    cep = json['cep'];
    uf = json['uf'];
    cidade = json['cidade'];
    bairro = json['bairro'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    complemento = json['complemento'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cnpj'] = this.cnpj;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['cep'] = this.cep;
    data['uf'] = this.uf;
    data['cidade'] = this.cidade;
    data['bairro'] = this.bairro;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class UsuarioModel {
  String? id;
  String? nome;
  String? email;
  String? passwordHash;
  String? createdAt;
  String? updatedAt;

  UsuarioModel(
      {this.id,
      this.nome,
      this.email,
      this.passwordHash,
      this.createdAt,
      this.updatedAt});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    passwordHash = json['password_hash'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['password_hash'] = this.passwordHash;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

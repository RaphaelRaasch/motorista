class MotoristaModel {
  int idMultidev;
  int user;
  String nome;
  String cpf;
  String mopp;
  String moppValidade;
  String cnh;
  String cnhCategoria;
  String cnhValidade;

  MotoristaModel(
      {this.idMultidev,
      this.user,
      this.nome,
      this.cpf,
      this.mopp,
      this.moppValidade,
      this.cnh,
      this.cnhCategoria,
      this.cnhValidade});

  MotoristaModel.fromJson(Map<String, dynamic> json) {
    idMultidev = json['id_multidev'];
    user = json['user'];
    nome = json['nome'];
    cpf = json['cpf'];
    mopp = json['mopp'];
    moppValidade = json['mopp_validade'];
    cnh = json['cnh'];
    cnhCategoria = json['cnh_categoria'];
    cnhValidade = json['cnh_validade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_multidev'] = this.idMultidev;
    data['user'] = this.user;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['mopp'] = this.mopp;
    data['mopp_validade'] = this.moppValidade;
    data['cnh'] = this.cnh;
    data['cnh_categoria'] = this.cnhCategoria;
    data['cnh_validade'] = this.cnhValidade;
    return data;
  }
}

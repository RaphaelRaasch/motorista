class MtrModel {
  int numero;
  int motorista;
  String alias;
  String saida;
  String chegada;
  String caminhao;

  MtrModel(
      {this.numero,
      this.motorista,
      this.alias,
      this.saida,
      this.chegada,
      this.caminhao});

  MtrModel.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    motorista = json['motorista'];
    alias = json['alias'];
    saida = json['saida'];
    chegada = json['chegada'];
    caminhao = json['caminhao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    data['motorista'] = this.motorista;
    data['alias'] = this.alias;
    data['saida'] = this.saida;
    data['chegada'] = this.chegada;
    data['caminhao'] = this.caminhao;
    return data;
  }
}

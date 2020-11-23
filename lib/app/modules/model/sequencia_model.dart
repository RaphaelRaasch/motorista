class SequenciaModel {
  int id;
  int numero;
  int mtr;
  int cliente;
  String clienteNome;
  String rua;
  String bairro;
  String municipio;
  String estado;
  String lat;
  String long;
  int sacolas;
  int sacolasBio;
  int tambores;
  int bombonas;
  int bags;
  int latas;
  String receptor;
  bool iniciada;
  bool visitou;
  bool coletou;
  bool finalizada;

  SequenciaModel(
      {this.id,
      this.numero,
      this.mtr,
      this.cliente,
      this.clienteNome,
      this.rua,
      this.bairro,
      this.municipio,
      this.estado,
      this.lat,
      this.long,
      this.sacolas,
      this.sacolasBio,
      this.tambores,
      this.bombonas,
      this.bags,
      this.latas,
      this.receptor,
      this.iniciada,
      this.visitou,
      this.coletou,
      this.finalizada});

  SequenciaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numero = json['numero'];
    mtr = json['mtr'];
    cliente = json['cliente'];
    clienteNome = json['cliente_nome'];
    rua = json['rua'];
    bairro = json['bairro'];
    municipio = json['municipio'];
    estado = json['estado'];
    lat = json['lat'];
    long = json['long'];
    sacolas = json['sacolas'];
    sacolasBio = json['sacolasBio'];
    tambores = json['tambores'];
    bombonas = json['bombonas'];
    bags = json['bags'];
    latas = json['latas'];
    receptor = json['receptor'];
    iniciada = json['iniciada'];
    visitou = json['visitou'];
    coletou = json['coletou'];
    finalizada = json['finalizada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numero'] = this.numero;
    data['mtr'] = this.mtr;
    data['cliente'] = this.cliente;
    data['cliente_nome'] = this.clienteNome;
    data['rua'] = this.rua;
    data['bairro'] = this.bairro;
    data['municipio'] = this.municipio;
    data['estado'] = this.estado;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['sacolas'] = this.sacolas;
    data['sacolasBio'] = this.sacolasBio;
    data['tambores'] = this.tambores;
    data['bombonas'] = this.bombonas;
    data['bags'] = this.bags;
    data['latas'] = this.latas;
    data['receptor'] = this.receptor;
    data['iniciada'] = this.iniciada;
    data['visitou'] = this.visitou;
    data['coletou'] = this.coletou;
    data['finalizada'] = this.finalizada;
    return data;
  }
}

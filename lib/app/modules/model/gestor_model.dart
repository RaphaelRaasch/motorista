class GestorModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String fone;
  String cpf;
  String type;

  GestorModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.fone,
      this.cpf,
      this.type});

  GestorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    fone = json['fone'];
    cpf = json['cpf'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['fone'] = this.fone;
    data['cpf'] = this.cpf;
    data['type'] = this.type;
    return data;
  }
}

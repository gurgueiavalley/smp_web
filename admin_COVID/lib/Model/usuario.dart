class UsuarioModel {
  Data data;

  UsuarioModel({this.data});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Usuarios> usuarios;

  Data({this.usuarios});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['usuarios'] != null) {
      usuarios = new List<Usuarios>();
      json['usuarios'].forEach((v) {
        usuarios.add(new Usuarios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuarios != null) {
      data['usuarios'] = this.usuarios.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Usuarios {
  String email;
  String nome;
  List<Respostas> respostas;

  Usuarios({this.email, this.nome, this.respostas});

  Usuarios.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    nome = json['nome'];
    if (json['respostas'] != null) {
      respostas = new List<Respostas>();
      json['respostas'].forEach((v) {
        respostas.add(new Respostas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['nome'] = this.nome;
    if (this.respostas != null) {
      data['respostas'] = this.respostas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Respostas {
  String resposta;

  Respostas({this.resposta});

  Respostas.fromJson(Map<String, dynamic> json) {
    resposta = json['resposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resposta'] = this.resposta;
    return data;
  }
}

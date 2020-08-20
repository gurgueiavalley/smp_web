class Instituicao {
  Data _data;

  Instituicao({Data data}) {
    this._data = data;
  }

  Data get data => _data;
  set data(Data data) => _data = data;

  Instituicao.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  List<Instituicoes> _instituicoes;

  Data({List<Instituicoes> instituicoes}) {
    this._instituicoes = instituicoes;
  }

  List<Instituicoes> get instituicoes => _instituicoes;
  set instituicoes(List<Instituicoes> instituicoes) =>
      _instituicoes = instituicoes;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['instituicoes'] != null) {
      _instituicoes = new List<Instituicoes>();
      json['instituicoes'].forEach((v) {
        _instituicoes.add(new Instituicoes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._instituicoes != null) {
      data['instituicoes'] = this._instituicoes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Instituicoes {
  String _descricao;
  int _id;
  String _img;
  String _nome;

  Instituicoes({String descricao, int id, String img, String nome}) {
    this._descricao = descricao;
    this._id = id;
    this._img = img;
    this._nome = nome;
  }

  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  int get id => _id;
  set id(int id) => _id = id;
  String get img => _img;
  set img(String img) => _img = img;
  String get nome => _nome;
  set nome(String nome) => _nome = nome;

  Instituicoes.fromJson(Map<String, dynamic> json) {
    _descricao = json['descricao'];
    _id = json['id'];
    _img = json['img'];
    _nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this._descricao;
    data['id'] = this._id;
    data['img'] = this._img;
    data['nome'] = this._nome;
    return data;
  }
}

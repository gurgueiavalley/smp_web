import 'package:admin_chat/constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

class RespostaQuery {
  // listar
/*   String queryListarResposta() {
    String query = """
      subscription MySubscription {
      respostas {
        id
        resposta
      }
    }    
    """;

    return query;
  }
} */

// listar
  String queryListarResposta(int idInst) {
    String query = """
      query MyQuery {
      usuarios(where: {id_instituicao: {_eq: "$idInst"}}) {
        email
        nome
        respostas {
          resposta
          id
        }
      }
    }
    
    """;

    return query;
  }

/*
query MyQuery {
    usuarios(where: {instituico: {}, id_instituicao: {_eq: 19}}) {
    id_google
    nome
    idade
    email
    respostas {
      resposta
      data
    }
  }
}
 */

}

import 'package:admin_chat/constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

class RespostaQuery {
  // listar
<<<<<<< HEAD
/*   String queryListarResposta() {
=======
  String queryListarResposta() {
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4
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
<<<<<<< HEAD
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
=======
}
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4

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
<<<<<<< HEAD

}
=======
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4

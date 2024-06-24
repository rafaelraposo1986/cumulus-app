import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'user_info.dart';
String usuarioAtual = UserInfo.idUser;

class AgradecimentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     MCPUtils.sendEventToMCP("Visualizou página de agradecimento", usuarioAtual, "mobile_app");
    return Scaffold(
      appBar: AppBar(
        title: Text("Agradecimento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ajuste 1: Subir mais a imagem
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                "https://vivaocredito.com.br/wp-content/uploads/2021/08/Cartao-Like-Bradesco.jpeg",
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 16),

            // Ajuste 2: Alinhar o texto ao centro
            Center(
              child: Text(
                "Obrigado por contratar o cartão de crédito",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 16),

            // Ajuste 3: Adicionar bloco de mensagem importante com bullet points
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mensagem Importante:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Bullet Point 1
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Seu cartão será entregue em até 10 dias úteis.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Bullet Point 2
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Você receberá informações sobre a entrega via WhatsApp.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Botão para voltar para a Home
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("Voltar para a Home"),
            ),
          ],
        ),
      ),
    );
  }
}

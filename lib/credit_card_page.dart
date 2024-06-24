import 'package:flutter/material.dart';
import 'card_details_page.dart';
import 'mcp_utils.dart';
import 'user_info.dart';
String usuarioAtual = UserInfo.idUser;

class CreditCardPage extends StatefulWidget {
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  @override
  void initState() {
    super.initState();
    MCPUtils.sendEventToMCP("Acessou pagina de cartao de credito", usuarioAtual, "mobile_app");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contratar Cartão de Crédito"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Foto do cartão
            Image.asset(
              "assets/credit_card_image.png", // Substitua pelo caminho correto da imagem do cartão
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),

            // Descritivo dos benefícios
            Text(
              "Principais Benefícios:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "1. Sem anuidade\n2. Programa de pontos\n3. Saques emergenciais",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Botão para avançar
            ElevatedButton(
              onPressed: () {
                MCPUtils.sendEventToMCP("Clicou em contratar Cartao de Credito", usuarioAtual, "mobile_app");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardDetailsPage()),
                );
              },
              child: Text("Contratar"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'user_info.dart';
import 'main.dart'; // Adicione esta linha para importar o arquivo main.dart onde a classe MyApp está definida

class InvestmentDetailsPage extends StatelessWidget {
  final String investmentName;

  InvestmentDetailsPage({required this.investmentName});

  final TextEditingController _investmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$investmentName - Detalhes', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(42, 147, 213, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Digite o valor que deseja investir:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _investmentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final investmentAmount = _investmentController.text;
                MCPUtils.sendEventToMCP(
                    "Realizou Investimento - $investmentName",
                    UserInfo.idUser,
                    "mobile_app");
                // Adicione a lógica para realizar o investimento aqui
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Investimento realizado'),
                    content: Text('Você investiu R\$ $investmentAmount em $investmentName.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          // Aqui você pode chamar qualquer lógica de reload necessária
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(42, 147, 213, 1),
              ),
              child: Text('Realizar investimento', style: TextStyle(color: Colors.white)),                    
            ),
          ],
        ),
      ),
    );
  }
}

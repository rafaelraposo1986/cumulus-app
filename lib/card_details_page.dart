import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'mcp_utils.dart';
import 'agradecimento_page.dart';
import 'user_info.dart';
String usuarioAtual = UserInfo.idUser;

class CardDetailsPage extends StatefulWidget {
  const CardDetailsPage({Key? key}) : super(key: key);

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  double _selectedLimit = 5000; // Valor padrão do limite
  int _selectedDay = 1; // Valor padrão do dia de vencimento
  List<int> _days = [1, 5, 10, 15, 20];
  final double _minLimit = 1000;
  final double _maxLimit = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Cartão de Crédito"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Escolha do dia de vencimento
            Text(
              "Escolha o dia de vencimento:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<int>(
              value: _selectedDay,
              onChanged: (int? value) {
                setState(() {
                  _selectedDay = value!;
                });
              },
              items: _days.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),

            SizedBox(height: 16),

            // Barra de rolagem para escolher o limite do cartão
            Text(
              "Escolha o limite do cartão:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _selectedLimit,
              onChanged: (value) {
                setState(() {
                  _selectedLimit = value;
                });
              },
              min: _minLimit,
              max: _maxLimit,
              divisions: 18,
              label: NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(_selectedLimit),
            ),

            SizedBox(height: 8),

            // Mínimo e Máximo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(_minLimit)}",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text("${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(_maxLimit)}",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),

            SizedBox(height: 8),

            // Mostrar valor escolhido
            Text(
              "${NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(_selectedLimit)}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 16),

            // Botão para finalizar contratação
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para finalizar a contratação
                MCPUtils.sendEventToMCP("Contratou Cartao de Credito", usuarioAtual, "mobile_app");
               // Navega para a página de agradecimento
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgradecimentoPage()),
                );
              },
              child: Text("Finalizar Contratação"),
            ),
          ],
        ),
      ),
    );
  }
}

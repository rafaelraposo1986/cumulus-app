import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'confirma_desbloqueio_cartao.dart';
import 'user_info.dart';
String usuarioAtual = UserInfo.idUser;

class AtivarCartaoPage extends StatefulWidget {
  const AtivarCartaoPage({Key? key}) : super(key: key);

  @override
  _AtivarCartaoPageState createState() => _AtivarCartaoPageState();
}

class _AtivarCartaoPageState extends State<AtivarCartaoPage> {
  final List<int> _months = List.generate(12, (index) => index + 1);
  final List<int> _years = List.generate(10, (index) => DateTime.now().year + index);

  late TextEditingController _lastDigitsController;
  late TextEditingController _securityCodeController;
  int _selectedMonth = 1;
  int _selectedYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    _lastDigitsController = TextEditingController();
    _securityCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _lastDigitsController.dispose();
    _securityCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ativar Cartão"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem na parte superior
            Container(
              height: 150, // Ajuste a altura conforme necessário
              child: Image.network(
                "https://www.mobills.com.br/blog/wp-content/uploads/2021/07/Bradesco-Like.jpg",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Campos de texto
            TextField(
              controller: _lastDigitsController,
              decoration: const InputDecoration(labelText: "4 últimos dígitos do cartão"),
            ),
            TextField(
              controller: _securityCodeController,
              decoration: const InputDecoration(labelText: "Código de Segurança"),
            ),

            const SizedBox(height: 20),

            // Drop-down menus para mês e ano de vencimento
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<int>(
                  value: _selectedMonth,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedMonth = value!;
                    });
                  },
                  items: _months.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                DropdownButton<int>(
                  value: _selectedYear,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedYear = value!;
                    });
                  },
                  items: _years.map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Botão de ativação
            ElevatedButton(
            onPressed: () {
              // Lógica para ativar o cartão aqui
              MCPUtils.sendEventToMCP("Ativou cartao de credito", usuarioAtual, "App");

              // Navegar para a página de confirmação de desbloqueio do cartão
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CartaoDesbloqueadoPage()),
              );
            },
            child: const Text("Ativar Cartão"),
          ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'user_info.dart';

String usuarioAtual = UserInfo.idUser;

class CreditSimulationPage extends StatefulWidget {
  final String loanType;
  final String imageUrl;

  CreditSimulationPage({required this.loanType, required this.imageUrl});

  @override
  _CreditSimulationPageState createState() => _CreditSimulationPageState();
}

class _CreditSimulationPageState extends State<CreditSimulationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  String? _selectedTerm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.loanType} Simulação', style: TextStyle(color: Colors.white) ),
        backgroundColor: const Color.fromRGBO(42, 147, 213, 1),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            Image.network(
              widget.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor desejado',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o valor desejado';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedTerm,
              decoration: InputDecoration(
                labelText: 'Escolha o número de parcelas',
                border: OutlineInputBorder(),
              ),
              items: ['12', '24', '36', '48', '60'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('Até $value parcelas'),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTerm = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, selecione o número de parcelas';
                }
                return null;
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                MCPUtils.sendEventToMCP(
                    "Contratou ${widget.loanType}", usuarioAtual, "mobile_app");
                if (_formKey.currentState!.validate()) {
                  // Lógica para realizar simulação
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Contratação Realizada'),
                        content: Text(
                            'Valor: R\$${_amountController.text}\nParcelas: $_selectedTerm'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: const Text('Contratar',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

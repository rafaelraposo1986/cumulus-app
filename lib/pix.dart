import 'package:demo_cumulus/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'design_system.dart'; // Certifique-se de importar seu design system

class PixPage extends StatefulWidget {
  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  final _formKey = GlobalKey<FormState>();
  final MoneyMaskedTextController _valorController = MoneyMaskedTextController(leftSymbol: 'R\$ ', decimalSeparator: ',', thousandSeparator: '.');
  final TextEditingController _descricaoController = TextEditingController();
  String? _selectedFavorecido;

  final List<String> _favorecidos = [
      'Bruno Costa',
      'Claudio Becker',
      'Danielli Sousa',
      'Éber Gonçalves',
      'Eduardo Campos',
      'Eduardo Rodrigues',
      'Fábio Santos',
      'Fernanda Belfort',
      'Isabella Micali',
      'Isabella Montalvão',
      'Jair Pereira',
      'Juan Almeida',
      'Lucas Chabariberi',
      'Marcos Resende',
      'Nelito Bernardes',
      'Neusieli Taffarel',
      'Rafael Albuquerque',
      'Renê Soares',
      'Ricardo Félix',
  ];

  void _submitPIX() {
    if (_formKey.currentState?.validate() ?? false) {
      // Lógica para enviar o PIX
      final valor = _valorController.text;
      final favorecido = _selectedFavorecido;
      final descricao = _descricaoController.text;

      // Aqui você pode chamar uma função para enviar o PIX usando um serviço de backend
      print('Valor: $valor, Favorecido: $favorecido, Descrição: $descricao');
      
      // Mostrar o comprovante do PIX
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Comprovante PIX',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Image.asset(
                  'assets/pix-comprovante.png', // Caminho da imagem no assets
                  height: 100,
                ),
                SizedBox(height: 16),
                Text('Valor: $valor'),
                Text('Favorecido: $favorecido'),
                Text('Descrição: $descricao'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Ação de compartilhar (simulada)
                },
                child: Text('Compartilhar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fechar o modal
                  Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                },
                child: Text('Voltar para Home'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazer PIX'),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Valor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedFavorecido,
                decoration: InputDecoration(labelText: 'Favorecido'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFavorecido = newValue!;
                  });
                },
                items: _favorecidos.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um favorecido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição (opcional)'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey, // Cor do botão de cancelar
                    ),
                    child: Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _submitPIX,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBackgroundColor, // Cor do botão de enviar
                    ),
                    child: Text('Enviar PIX'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

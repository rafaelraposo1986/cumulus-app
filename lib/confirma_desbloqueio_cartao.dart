import 'package:flutter/material.dart';

class CartaoDesbloqueadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desbloqueio de Cartão'),
        backgroundColor: Color(0xFFF11234), // Ajuste a cor conforme a identidade visual
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green, // Cor de confirmação
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Seu cartão foi desbloqueado com sucesso!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Text('Voltar para o Início'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

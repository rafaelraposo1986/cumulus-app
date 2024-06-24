import 'package:flutter/material.dart';

class DicasProtecaoFraudePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proteção Contra Fraudes'),
        backgroundColor: Colors.blue, // Ajuste a cor conforme a identidade visual do seu app
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Como se Proteger de Fraudes no Cartão de Crédito',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '1. Nunca compartilhe seu PIN: Mantenha seu número de identificação pessoal (PIN) em segredo. Nunca o compartilhe com ninguém e não o escreva.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '2. Revise seus extratos regularmente: Verifique seus extratos de cartão de crédito regularmente para identificar quaisquer transações suspeitas ou não autorizadas.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '3. Cuidado com golpes online: Esteja atento a e-mails e sites fraudulentos que tentam obter suas informações pessoais e financeiras.',
              style: TextStyle(fontSize: 18),
            ),
            // Adicione mais dicas conforme necessário
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Entendi'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'investment_options_page.dart';
import 'user_info.dart';

class InvestmentPage extends StatelessWidget {
  final List<Map<String, dynamic>> investmentCategories = [
    {
      'title': 'Tesouro Direto',
      'description': 'Investimentos seguros com rendimento acima da poupança.',
      'options': [
        {
          'name': 'Tesouro Selic 2024',
          'minInvestment': 'R\$ 100,00',
          'returnLast12Months': '4.5%',
        },
        {
          'name': 'Tesouro IPCA+ 2035',
          'minInvestment': 'R\$ 50,00',
          'returnLast12Months': '5.1%',
        },
      ],
    },
    {
      'title': 'CDB',
      'description': 'Certificado de Depósito Bancário com diversas opções de rendimento.',
      'options': [
        {
          'name': 'CDB Liquidez Diária',
          'minInvestment': 'R\$ 500,00',
          'returnLast12Months': '5.2%',
        },
        {
          'name': 'CDB 2 anos',
          'minInvestment': 'R\$ 1000,00',
          'returnLast12Months': '6.0%',
        },
      ],
    },
    {
      'title': 'LCI e LCA',
      'description': 'Letra de Crédito Imobiliário e do Agronegócio, isentas de IR.',
      'options': [
        {
          'name': 'LCI Imobiliária',
          'minInvestment': 'R\$ 1.000,00',
          'returnLast12Months': '6.0%',
        },
        {
          'name': 'LCA Agronegócio',
          'minInvestment': 'R\$ 1.500,00',
          'returnLast12Months': '6.5%',
        },
      ],
    },
    {
      'title': 'Ações de Empresas',
      'description': 'Invista em ações de grandes empresas e tenha a chance de bons retornos.',
      'options': [
        {
          'name': 'Ações da Empresa X',
          'minInvestment': 'R\$ 200,00',
          'returnLast12Months': '10.5%',
        },
        {
          'name': 'Ações da Empresa Y',
          'minInvestment': 'R\$ 300,00',
          'returnLast12Months': '12.0%',
        },
      ],
    },
    {
      'title': 'Fundo de Investimentos',
      'description': 'Diversifique sua carteira com fundos de diferentes estratégias.',
      'options': [
        {
          'name': 'Fundo Multimercado',
          'minInvestment': 'R\$ 1.500,00',
          'returnLast12Months': '7.2%',
        },
        {
          'name': 'Fundo Imobiliário',
          'minInvestment': 'R\$ 2.000,00',
          'returnLast12Months': '8.0%',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investimentos', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(42, 147, 213, 1),
      ),
      body: ListView.builder(
        itemCount: investmentCategories.length,
        itemBuilder: (context, index) {
          final category = investmentCategories[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    category['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(category['description']!),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        MCPUtils.sendEventToMCP(
                            "Clicou em Ver Opções - ${category['title']}",
                            UserInfo.idUser,
                            "mobile_app");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvestmentOptionsPage(
                              category: category['title']!,
                              options: category['options'],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(42, 147, 213, 1),
                      ),
                      child: Text('Ver opções', style: TextStyle(color: Colors.white)),                    
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

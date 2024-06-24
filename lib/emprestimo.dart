import 'package:flutter/material.dart';
import 'simulacao_credito.dart';
import 'user_info.dart';
import 'mcp_utils.dart';

String usuarioAtual = UserInfo.idUser;

class LoanOffersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empréstimos', style: TextStyle(color: Colors.white)),
        backgroundColor:
            const Color.fromRGBO(42, 147, 213, 1), // Customize a cor conforme o tema do seu app
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Qual a melhor oferta pra você?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          // Lista de opções de empréstimo


          ////////////
          // CARD 1 //
          ////////////
          InkWell(
            onTap: () {
              MCPUtils.sendEventToMCP("Clicou em Emprestimo FGTS", usuarioAtual, "mobile_app");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreditSimulationPage(
                    loanType: 'FGTS',
                    imageUrl:
                        'https://capitalist.com.br/wp-content/uploads/2023/05/Saque-aniversario-FGTS-1-1000x600.jpg',
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Antecipe seu dinheiro parado no FGTS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '• Disponível até para negativados\n• Dinheiro na conta em até 1 dia útil\n• Taxas a partir de 1,29% ao mês',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        'https://capitalist.com.br/wp-content/uploads/2023/05/Saque-aniversario-FGTS-1-1000x600.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),

          ////////////
          // CARD 2 //
          ////////////

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreditSimulationPage(
                    loanType: 'Consignado',
                    imageUrl:
                        'https://appcredito.com.br/wp-content/uploads/2022/01/100-reais.jpg',
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Crédito consignado',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '• Disponível em até 2 dias úteis\n• Taxas a partir de 1,70% ao mês\n• Para aposentados e servicores federais',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        'https://appcredito.com.br/wp-content/uploads/2022/01/100-reais.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),

          ////////////
          // CARD 3 //
          ////////////
          
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreditSimulationPage(
                    loanType: 'Carro como garantia',
                    imageUrl:
                        'https://www.automaxfiat.com.br/wp-content/uploads/2021/10/refinanciamento-de-veiculo-1-1024x503.jpg',
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Use seu carro como garantia',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '• Peça até 90% do valor do seu veículo\n• Taxas a partir de 1,49% ao mês\n• Em até 60 parcelas',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        'https://www.automaxfiat.com.br/wp-content/uploads/2021/10/refinanciamento-de-veiculo-1-1024x503.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),

         

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Conheça também',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          // Seção 'Conheça também' com ícones
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                FeatureCard(
                  icon: Icons.payment,
                  label: 'Cartão de Crédito',
                ),
                FeatureCard(
                  icon: Icons.trending_up,
                  label: 'Open Finance',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  FeatureCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 48.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}

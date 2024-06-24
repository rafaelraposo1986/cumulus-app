import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'investment_details_page.dart';
import 'user_info.dart';

class InvestmentOptionsPage extends StatelessWidget {
  final String category;
  final List<Map<String, String>> options;

  InvestmentOptionsPage({required this.category, required this.options});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category - Opções', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(42, 147, 213, 1),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    option['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Valor mínimo de aporte: ${option['minInvestment']}'),
                  Text('Rendimento nos últimos 12 meses: ${option['returnLast12Months']}'),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        MCPUtils.sendEventToMCP(
                            "Clicou em Investir - ${option['name']}",
                            UserInfo.idUser,
                            "mobile_app");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvestmentDetailsPage(
                              investmentName: option['name']!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(42, 147, 213, 1),
                      ),
                      child: Text('Investir', style: TextStyle(color: Colors.white)),                    
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

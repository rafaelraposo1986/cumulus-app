import 'dart:math';
import 'package:demo_cumulus/pix.dart';
import 'package:flutter/material.dart';
import 'mcp_utils.dart';
import 'credit_card_page.dart';
import 'investment_page.dart';
import 'emprestimo.dart';
import 'user_info.dart';
import 'design_system.dart'; // Importa o arquivo design_system.dart

String usuarioAtual = UserInfo.idUser;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bannerImageURL = "https://i.gifer.com/origin/34/34338d26023e5515f6cc8969aa027bca.gif";
  // String bannerImageURL = "";
  String bannerPaginaDestino = "";
  String bannerCtaButtonCard = "";
  String bannerCardHeader = "";
  String bannerCardSubHeader = "";

  String campaignId = ""; // Adicionado
  String experienceId = ""; // Adicionado
  String campaignName = ""; // Adicionado

  // Função para gerar um saldo aleatório entre 1 e 1000
  String gerarSaldo() {
    final Random random = Random();
    final double saldo = random.nextDouble() * 1000;
    return saldo.toStringAsFixed(2); // Formato do Real Brasileiro
  }

  @override
  void initState() {
    super.initState();
    print("entrou na função initState");
    // Chamada da função consultaPersonalizacao quando o aplicativo é aberto
    MCPUtils.consultaPersonalizacao(usuarioAtual, _onBannerUpdate);
  }

  void _onBannerUpdate(
      String? imageURL,
      String? paginaDestino,
      String? cardHeader,
      String? ctaButtonCard,
      String? cardSubHeader,
      String? cid,
      String? eid,
      String? cname) {
    setState(() {
      // bannerImageURL = imageURL ?? "https://img.freepik.com/free-photo/surprised-attractive-guy-is-watching-cell-phone-holding-credit-card_8353-10112.jpg";
      bannerImageURL = imageURL ?? "";
      bannerPaginaDestino = paginaDestino ?? "";
      bannerCtaButtonCard = ctaButtonCard ?? "";
      bannerCardHeader = cardHeader ?? "";
      bannerCardSubHeader = cardSubHeader ?? "";
      campaignId = cid ?? ""; // Adicionado
      experienceId = eid ?? ""; // Adicionado
      campaignName = cname ?? ""; // Adicionado
    });
    // Enviar estatística de impressão do banner
    if (imageURL != null) {
      MCPUtils.sendCampaignStats(
          usuarioAtual, campaignId, experienceId, campaignName, "Impression");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor, // Usa a cor do design system
        title: Image.asset(
          "assets/brand-logo.png",
          fit: BoxFit.contain,
          height: AppBar().preferredSize.height *
              1.5, // Ajuste a altura do logo conforme necessário
        ),
        centerTitle: true, // Centraliza o logo na AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Label informando o usuário logado
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'O ID do usuário logado é: $usuarioAtual',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              )),

              Card(
                color: AppColors.cardBackgroundColor, // Usa a cor do design system
                elevation: 4.0, // Sombra em torno do card
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0), // Padding ajustado
                  child: Row(
                    // Mudar de Column para Row
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Alinha horizontalmente de maneira espaçada
                    children: [
                      Expanded(
                        // Widget Expanded para que o texto ocupe o espaço restante
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize
                              .min, // Ocupa o mínimo espaço necessário
                          children: [
                            Text(
                              "Saldo em conta",
                              style: AppTextStyles.cardHeaderTextStyle, // Usa o estilo do design system
                            ),
                            Text(
                              "R\$ ${gerarSaldo()}",
                              style: AppTextStyles.cardBalanceTextStyle, // Usa o estilo do design system
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Ação do botão para ir para o extrato
                        },
                        child: Text(
                          "Extrato",
                          style: AppTextStyles.buttonTextStyle, // Usa o estilo do design system
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.buttonBackgroundColor, // Usa a cor do design system
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16), // Padding do botão ajustado
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 200, // Altura do banner
                margin: EdgeInsets.only(top: 5), // Espaço acima do banner
                child: Card(
                  color: Colors.white, // Fundo branco para o Card
                  elevation: 5, // Sombra do card
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Borda arredondada
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2, // Ocupa 2/3 do espaço
                        child: Padding(
                          padding: EdgeInsets.all(12), // Padding interno
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                bannerCardHeader, // Título da oferta
                                style: AppTextStyles.bannerTitleTextStyle, // Usa o estilo do design system
                              ),
                              SizedBox(height: 8),
                              Text(
                                bannerCardSubHeader, // Descrição da oferta
                                style: AppTextStyles.bannerDescriptionTextStyle, // Usa o estilo do design system
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Ação do CTA
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: AppColors.buttonBackgroundColor, // Usa a cor do design system
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10), // Padding do botão
                                ),
                                child: Text(
                                  bannerCtaButtonCard, // Texto do CTA
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1, // Ocupa 1/3 do espaço
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                10), // Arredondado apenas no canto superior direito
                            bottomRight: Radius.circular(
                                10), // E no canto inferior direito
                          ),
                          child: Image.network(
                            bannerImageURL, // Link para a imagem da oferta
                            height:
                                150, // Mesma altura do container para preencher totalmente
                            fit:
                                BoxFit.cover, // Cobrir todo o espaço disponível
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Espaçamento reduzido
              SizedBox(height: 20),

              // Círculos de Navegação
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavigationCircle(
                        icon: Icons.request_quote,
                        text: "Empréstimo",
                        onTap: () {
                          MCPUtils.sendEventToMCP("Clicou em Emprestimo",
                              usuarioAtual, "mobile_app");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoanOffersPage()),
                          );
                        }),
                    NavigationCircle(
                      icon: Icons.credit_card,
                      text: "Cartões",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreditCardPage()),
                        );
                      },
                    ),
                    NavigationCircle(
                        icon: Icons.pix, text: "PIX", onTap: () {
                          MCPUtils.sendEventToMCP("Clicou em PIX", usuarioAtual, "mobile_app");
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => PixPage()));
                        }),
                    NavigationCircle(
                        icon: Icons.trending_up,
                        text: "Investimentos",
                        onTap: () {
                          MCPUtils.sendEventToMCP("Clicou em Investimentos",
                              usuarioAtual, "mobile_app");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InvestmentPage()),
                          );
                        }),
                  ],
                ),
              ),

              Container(
                height: 200, // Altura do card
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // CARD 1
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Largura do card
                      margin: EdgeInsets.only(
                          right: 10), // Espaçamento entre os cards
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Borda arredondada
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: 10,
                              right: MediaQuery.of(context).size.width *
                                  0.4, // 60% da largura para o texto
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Oferta especial IPVA 2024', // Título
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Parcele a partir de 10x e receba 10% de cashback', // Subtítulo
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              right: 10,
                              bottom: 40, // Ajusta o espaço para o botão abaixo
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.3, // 40% da largura do dispositivo
                                height: MediaQuery.of(context).size.height *
                                    0.2, // 20% da altura do dispositivo
                                child: Image.network(
                                  'https://valencaagora.com/wp-content/uploads/2018/01/ipva_394-01.png', // Sua URL de imagem
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Ação do botão
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Cor de fundo do botão
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                child: const Text(
                                  'Pagar IPVA',
                                  style: TextStyle(color: Colors.white),
                                ), // Texto do botão
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // CARD 2
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Largura do card
                      margin: EdgeInsets.only(
                          right: 10), // Espaçamento entre os cards
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Borda arredondada
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: 10,
                              right: MediaQuery.of(context).size.width *
                                  0.4, // 60% da largura para o texto
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Seguro para celular', // Título
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Contratação 100% digital, sem burocracia e com planos a partir de 9,90.', // Subtítulo
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              right: 10,
                              bottom: 40, // Ajusta o espaço para o botão abaixo
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.3, // 40% da largura do dispositivo
                                height: MediaQuery.of(context).size.height *
                                    0.2, // 20% da altura do dispositivo
                                child: Image.network(
                                  'https://i0.wp.com/revistaapolice.com.br/wp-content/uploads/2019/01/20150203154853_660_420.jpg', // Sua URL de imagem
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Ação do botão
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Cor de fundo do botão
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                child: const Text(
                                  'Contratar',
                                  style: TextStyle(color: Colors.white),
                                ), // Texto do botão
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // CARD 3
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.8, // Largura do card
                      margin: EdgeInsets.only(
                          right: 10), // Espaçamento entre os cards
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // Borda arredondada
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 30,
                              left: 10,
                              right: MediaQuery.of(context).size.width *
                                  0.4, // 60% da largura para o texto
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Aproveite o cashback', // Título
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Com o cumulus Card você tem benefícios e promoções exclusivas', // Subtítulo
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -20,
                              right: 10,
                              bottom: 40, // Ajusta o espaço para o botão abaixo
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.3, // 40% da largura do dispositivo
                                height: MediaQuery.of(context).size.height *
                                    0.2, // 20% da altura do dispositivo
                                child: Image.network(
                                  'https://einvestidor.estadao.com.br/wp-content/uploads/2022/04/whatsappimage20220425at183753_250420223820.jpeg', // Sua URL de imagem
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Ação do botão
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Cor de fundo do botão
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                child: const Text(
                                  'Saiba mais',
                                  style: TextStyle(color: Colors.white),
                                ), // Texto do botão
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Título "O que deseja fazer?"
              Text(
                "Quero saber mais sobre...",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              // Espaçamento entre o título e os quadrados
              SizedBox(height: 10),

              // Quadrados
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionSquare(
                        icon: Icons.local_atm,
                        text: "Benefícios",
                        onTap: () {}),
                    ActionSquare(
                        icon: Icons.account_balance,
                        text: "Open Finance",
                        onTap: () {}),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionSquare(
                        icon: Icons.lightbulb,
                        text: "Dicas de Finanças",
                        onTap: () {}),
                    ActionSquare(
                        icon: Icons.people,
                        text: "Indique um amigo",
                        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationCircle extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  NavigationCircle(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.navigationCircleColor, // Usa a cor do design system
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(text, style: AppTextStyles.navigationCircleTextStyle), // Usa o estilo do design system
        ],
      ),
    );
  }
}

class ActionSquare extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ActionSquare({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.actionSquareColor, // Usa a cor do design system
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,
                size: 50,
                color: Colors.white), // Ícone centralizado na parte superior
            Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.actionSquareTextStyle, // Usa o estilo do design system
            ), // Texto centralizado na parte inferior
          ],
        ),
      ),
    );
  }
}

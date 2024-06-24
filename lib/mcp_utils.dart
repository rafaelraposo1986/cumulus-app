import 'dart:convert';
import 'package:http/http.dart' as http;

const urlMCP = "https://ralbuquerque523005250.us-4.evergage.com/api2/authevent/cumulus";
const authMCP = 'Basic QUFDRUE3NEUtMUIxRC00NzlDLTg4MzUtRjRERjIzOEY2NzZGOlN4V0pEc2xKSVhDTExhWEpZbUNmU2dEM2ItVEJEZTcxUnVmVmhwWWNmUk0=';

class MCPUtils {
  static Future<void> sendEventToMCP(String action, String userId, String channel) async {
    const apiUrl = urlMCP;

    final headers = {
      'Authorization': authMCP,
      'Content-Type': 'application/json',
    };

    final payload = {
      "action": action,
      "user": {"id": userId},
      "source": {"channel": channel}
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print("Evento: $action - enviado com sucesso!");
      } else {
        print("Erro ao enviar evento: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao enviar evento: $e");
    }
  }

  static Future<void> consultaPersonalizacao(String userId, Function(String?, String?, String?, String?, String?, String?, String?, String?) onBannerUpdate) async {
    const apiUrl = urlMCP;
    final headers = {
      'Authorization': authMCP,
      'Content-Type': 'application/json',
    };

    final payload = {
      "action": "Consulta NBA",
      "user": {"id": userId},
      "source": {"channel": "Server", "contentZones": ["Hero Banner"]},
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(payload),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final campaignResponses = jsonResponse["campaignResponses"] as List<dynamic>?;

        if (campaignResponses != null && campaignResponses.isNotEmpty) {
          final firstCampaign = campaignResponses[0];
          final campaignPayload = firstCampaign["payload"];

          final imageURL = campaignPayload["imageURL"] as String?;
          final paginaDestino = campaignPayload["pagina_destino"] as String?;
          final cardHeader = campaignPayload["CardHeader"] as String?;
          final ctaButtonCard = campaignPayload["ctaButtonCard"] as String?;
          final cardSubHeader = campaignPayload["CardSubHeader"] as String?;
          final campaignId = firstCampaign["campaignId"] as String?;
          final experienceId = firstCampaign["experienceId"] as String?;
          final campaignName = firstCampaign["campaignName"] as String?;

          onBannerUpdate(imageURL, paginaDestino, cardHeader, ctaButtonCard, cardSubHeader, campaignId, experienceId, campaignName);
          // imageURL, paginaDestino, cardHeader, ctaButtonCard, cardSubHeader, cid, eid, cname
        } else {
          print("Não foram encontradas campanhas na resposta.");
          onBannerUpdate(null, null, null, null, null, null, null, null);
        }
      } else {
        print("Erro na consulta de personalização: ${response.statusCode}");
        onBannerUpdate(null, null, null, null, null, null, null, null);
      }
    } catch (e) {
      print("Erro na consulta de personalização: $e");
      onBannerUpdate(null, null, null, null, null, null, null, null);
    }
  }

  static Future<void> sendCampaignStats(String userId, String? campaignId, String? experienceId, String? campaignName, String stat) async {
    if (campaignId == null || experienceId == null || campaignName == null) {
      print("CampaignId, ExperienceId ou CampaignName estão nulos, não enviando estatísticas.");
      return;
    }

    const apiUrl = urlMCP;
    final headers = {
      'Authorization': authMCP,
      'Content-Type': 'application/json',
    };

    final action = "$stat - $campaignName";

    final payload = {
      "action": action,
      "user": {"id": userId},
      "source": {"channel": "Server"},
      "campaignStats": [
        {
          "campaignId": campaignId,
          "experienceId": experienceId,
          "stat": stat,
          "control": false
        }
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print("Estatística da campanha ($action) enviada com sucesso!");
      } else {
        print("Erro ao enviar estatística da campanha ($action): ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao enviar estatística da campanha ($action): $e");
    }
  }

  static Future<void> sendBannerClickEvent(String userId, String? campaignId, String? experienceId, String? campaignName) async {
    sendCampaignStats(userId, campaignId, experienceId, campaignName, "Click");
  }
}

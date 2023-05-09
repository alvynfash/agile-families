import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'dart:async';

import 'package:shelf/shelf.dart';

Future<Map<String, dynamic>> scrapeLatestToon() async {
  var baseUrl = 'https://www.modernanalyst.com';
  var url =
      '$baseUrl/Resources/BusinessAnalystHumor/tabid/218/ID/6087/Agile_Families_-_Correctly_Phrased_User_Stories.aspx';
  var response = await http.get(Uri.parse(url));
  var document = parser.parse(response.body);

  var toonTitle = document.querySelector('h2')?.text.trim();
  var toonImage = document.querySelector('img[loading="lazy"]');

  String toonImageUrl;
  if (toonImage != null) {
    toonImageUrl = baseUrl + toonImage.attributes['src']!;
  } else {
    toonImageUrl = 'Image not found';
  }

  return {
    'title': toonTitle,
    'image_url': toonImageUrl,
    'date': DateTime.now()
  };
}

void printToonData(Map<String, dynamic> toonData) {
  print('Toon data: $toonData');
}

Future<Response> toonHandler(Request req) async {
  while (true) {
    // Scrape and print the toon data
    var toonData = await scrapeLatestToon();
    // printToonData(toonData);

    // Convert DateTime to string
    var toonDateStr = toonData['date'].toString();
    toonData['date'] = toonDateStr;

    // Encode toonData to JSON with indentation
    var jsonStr = JsonEncoder.withIndent('  ').convert(toonData);

    // Return JSON response with content-type header
    return Response.ok(jsonStr, headers: {'Content-Type': 'application/json'});
  }
}

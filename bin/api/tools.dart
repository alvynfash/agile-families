import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

class Tools {
  static Response createEncodedResponse(Object object) {
    // Encode to JSON with indentation
    final jsonStr = JsonEncoder.withIndent('  ').convert(object);

    // Return JSON response with content-type header
    return Response.ok(jsonStr, headers: {'Content-Type': 'application/json'});
  }

  static getFile(String filePath) {
    final html = File(filePath).readAsStringSync();
    return Response.ok(html);
  }
}

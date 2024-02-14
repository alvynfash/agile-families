import 'dart:convert';

import 'package:shelf/shelf.dart';

class Tools {
  static Response createEncodedResponse(Object object) {
    // Encode to JSON with indentation
    var jsonStr = JsonEncoder.withIndent('  ').convert(object);

    // Return JSON response with content-type header
    return Response.ok(jsonStr, headers: {'Content-Type': 'application/json'});
  }
}

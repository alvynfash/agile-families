import 'dart:async';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

class Tools {
  static Response createEncodedResponse(Object object) {
    // Encode to JSON with indentation
    final jsonStr = JsonEncoder.withIndent('  ').convert(object);

    // Return JSON response with content-type header
    return Response.ok(jsonStr, headers: {'Content-Type': 'application/json'});
  }

  static Future<Response> getFile(String fileName, Request request) async {
    return createStaticHandler(
      '../files',
      defaultDocument: fileName,
    )(request);
  }
}

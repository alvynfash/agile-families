import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

class Tools {
  static Response createEncodedResponse(Object object) {
    // Encode to JSON with indentation
    final jsonStr = JsonEncoder.withIndent('  ').convert(object);

    // Return JSON response with content-type header
    return Response.ok(jsonStr, headers: {'Content-Type': 'application/json'});
  }

  static FutureOr<Response> getFile(String fileName, Request request) async {
    // Get the URI of the Dart script file
    var scriptUri = Platform.script;

    // Get the path of the directory containing the Dart script file
    var scriptPath = Directory.fromUri(scriptUri).path;

    // Construct the path to the directory containing the HTML files
    var pathToHtmlFiles = dirname(scriptPath);

    // final html = File(filePath).readAsStringSync();
    // return Response.ok(html);

    return createStaticHandler(
      '$pathToHtmlFiles/files',
      defaultDocument: fileName,
      serveFilesOutsidePath: true,
    )(request);
  }
}

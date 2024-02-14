import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:path/path.dart';

Future<Response> rootHandler(Request request) async {
  while (true) {
    // Get the URI of the Dart script file
    var scriptUri = Platform.script;

    // Get the path of the directory containing the Dart script file
    var scriptPath = Directory.fromUri(scriptUri).path;

    // Construct the path to the directory containing the HTML files
    var pathToHtmlFiles = dirname(scriptPath);

    // Set up a shelf handler for serving static files
    final staticHandler = createStaticHandler(
      pathToHtmlFiles,
      defaultDocument: 'index.html',
    );

    return staticHandler(request);
  }
}

import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

Future<Response> rootHandler(Request request) async {
  while (true) {
    // Set up a shelf handler for serving static files
    final staticHandler = createStaticHandler(
      '${Directory.current.path}/bin',
      defaultDocument: 'index.html',
    );

    return staticHandler(request);
  }
}

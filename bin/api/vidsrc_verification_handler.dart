import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

Future<Response> vidsrcVerificationHandler(Request request) async {
  while (true) {
    // Set up a shelf handler for serving static files
    final staticHandler = createStaticHandler(
      '${Directory.current.path}/bin',
      defaultDocument: 'deab6710f84b7f4503359b80e4e738fb.txt',
    );

    return staticHandler(request);
  }
  // return Response.ok(
  //     'Hello, Simple API to retreive toons from Agile-families!');
}

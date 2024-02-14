import 'package:shelf/shelf.dart';

import 'tools.dart';

Future<Response> rootHandler(Request request) async {
  return Tools.getFile('index.html', request);
}

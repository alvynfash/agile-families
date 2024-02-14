import 'package:shelf/shelf.dart';

import 'toon_handler.dart';

Future<Response> apiHandler(Request request) async {
  if (request.url.pathSegments.contains('toons')) {
    return await toonHandler(request);
  }

  return Response.notFound('Route not found.');
}

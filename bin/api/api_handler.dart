import 'package:shelf/shelf.dart';

import 'tools.dart';
import 'toon_handler.dart';

Future<Response> apiHandler(Request request) async {
  if (request.url.pathSegments.contains('toons')) {
    return await toonHandler(request);
  }

  var response = {
    'message': 'Agile Family API is live',
    'api_routes': ['/toons', '/toons/{coming_soon}']
  };
  return Tools.createEncodedResponse(response);
}

import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'api/root_handler.dart';
import 'api/api_handler.dart';
import 'api/vidsrc_verification_handler.dart';

// ..get('/toon', toonHandler);

Response _pingHandler(Request request) => Response.ok('Pong');

// Response _toonHandler(Request request) {
//   final message = request.params['message'];
//   return Response.ok('tooooon...');
// }

void main(List<String> args) async {
// Configure routes.
  final router = Router()
    ..get('/ping', _pingHandler)
    ..get('/', rootHandler)
    ..get('/deab6710f84b7f4503359b80e4e738fb.txt', vidsrcVerificationHandler)
    ..all('/api/<ignored|.*>', apiHandler);

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}

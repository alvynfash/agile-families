import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

class FileController {
  Handler findOne() {
    return createStaticHandler('../files');
  }
}

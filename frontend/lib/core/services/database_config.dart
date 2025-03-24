// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// created by `flutter pub run build_runner build`
import '/objectbox.g.dart';

class ObjectBox {
  ObjectBox._create(this.store);

  late final Store store;

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "offline"));
    return ObjectBox._create(store);
  }
}

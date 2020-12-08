@JS()
library actions.core;

import 'package:js/js.dart';
import 'require.dart';

late final core = require('@actions/core');

@JS()
@anonymous
class InputOptions {
  external bool get required;

  // Must have an unnamed factory constructor with named arguments.
  external factory InputOptions({bool required});
}

@JS()
@anonymous
abstract class Core {
  external void exportVariable(String name, String val);
  external void setSecret(String secret);
  external void addPath(String inputPath);
  external String getInput(String name, InputOptions options);
  external void setOutput(String name, dynamic value);
  external void setCommandEcho(bool enabled);
  external void setFailed(String message);
  external bool isDebug();
  external void debug(String message);
  external void error(String message);
  external void warning(String message);
  external void info(String message);
  external void startGroup(String name);
  external void endGroup();
  static Future<T> group<T>(String name, Future<T> Function() fn) async {
    core.startGroup(name);
    try {
      return await fn();
    }
    finally {
      core.endGroup();
    }
  }
  external void saveState(String name, dynamic value);
  external String getState(String name);
}

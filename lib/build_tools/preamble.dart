import 'dart:async';

import "package:node_preamble/preamble.dart" as preamble;
import 'package:build/build.dart';


class NodePreambleBuilder extends Builder {
  @override
  Future<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var contents = await buildStep.readAsString(inputId);

    var node = inputId.changeExtension('.node.js');
    await buildStep.writeAsString(node, '${preamble.getPreamble()}\n$contents');
  }

  @override
  final buildExtensions = const {
    '.dart.js': ['.dart.node.js']
  };
}

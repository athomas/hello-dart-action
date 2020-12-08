import 'core.dart';

void main() {
  final name = core.getInput('name', InputOptions());
  Core.group('say my name', () async {
    print('Hello $name!');
  });
}
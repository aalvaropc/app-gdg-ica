import 'package:gdgica/network/index.dart';

enum Flavor { mock, rest, firebase }

enum DataMode { dart, json }

//DI
class Injector {
  static final Injector _singleton = Injector._internal();
  static late Flavor _flavor;
  static late DataMode _dataMode;

  static void configure(Flavor flavor, DataMode dataMode) {
    _flavor = flavor;
    _dataMode = dataMode;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  IClient get currentClient {
    switch (_flavor) {
      case Flavor.mock:
        return MockClient();
      case Flavor.firebase:
        //* Yet to add
        return FirebaseClient();
      default:
        return RestClient();
    }
  }

  DataMode get currentDataMode {
    switch (_dataMode) {
      case DataMode.dart:
        return DataMode.dart;
      case DataMode.json:
        return DataMode.json;
      default:
        return DataMode.dart;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _phoneNumber =
          await secureStorage.getString('ff_phoneNumber') ?? _phoneNumber;
    });
    await _safeInitAsync(() async {
      _isLogin = await secureStorage.getBool('ff_isLogin') ?? _isLogin;
    });
    await _safeInitAsync(() async {
      _name = await secureStorage.getString('ff_name') ?? _name;
    });
    await _safeInitAsync(() async {
      _idCard = await secureStorage.getString('ff_idCard') ?? _idCard;
    });
    await _safeInitAsync(() async {
      _vehicleregistration =
          await secureStorage.getString('ff_vehicleregistration') ??
              _vehicleregistration;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _phoneNumber = '[phone_number]';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
    secureStorage.setString('ff_phoneNumber', value);
  }

  void deletePhoneNumber() {
    secureStorage.delete(key: 'ff_phoneNumber');
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    secureStorage.setBool('ff_isLogin', value);
  }

  void deleteIsLogin() {
    secureStorage.delete(key: 'ff_isLogin');
  }

  String _name = '[name]';
  String get name => _name;
  set name(String value) {
    _name = value;
    secureStorage.setString('ff_name', value);
  }

  void deleteName() {
    secureStorage.delete(key: 'ff_name');
  }

  String _idCard = '[id_card]';
  String get idCard => _idCard;
  set idCard(String value) {
    _idCard = value;
    secureStorage.setString('ff_idCard', value);
  }

  void deleteIdCard() {
    secureStorage.delete(key: 'ff_idCard');
  }

  String _vehicleregistration = '[vehicle_registration]';
  String get vehicleregistration => _vehicleregistration;
  set vehicleregistration(String value) {
    _vehicleregistration = value;
    secureStorage.setString('ff_vehicleregistration', value);
  }

  void deleteVehicleregistration() {
    secureStorage.delete(key: 'ff_vehicleregistration');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}

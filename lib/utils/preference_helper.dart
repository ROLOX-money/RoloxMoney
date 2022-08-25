import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static setPreference(String keyPair, dynamic argValues) async {
    // final String? deviceId =
    //     await DeviceInfoPlugin().androidInfo.then((value) => value.id);
    await SharedPreferences.getInstance().then((value) {
      value.setString(keyPair, argValues.toString());
      /*(argValues == '' || argValues == null)
              ? argValues
              : Encrypter(AES(Key.fromUtf8(deviceId!)))
                  .encrypt(argValues.toString(), iv: IV.fromLength(16))
                  .base16);*/
    });
  }

  static Future<String?> getString({required String keyPair}) async {
    // final String? deviceId = await PlatformDeviceId.getDeviceId;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? temporaryValues = prefs.getString(keyPair);
    return temporaryValues;
  }

  static Future<double?> getDouble({required String keyPair}) async {
    // final String? deviceId = await PlatformDeviceId.getDeviceId;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? temporaryValues = prefs.getString(keyPair);
    return temporaryValues == null ? null : double.parse(temporaryValues);
  }

  static Future<int?> getInt({required String keyPair}) async {
    // final String? deviceId = await PlatformDeviceId.getDeviceId;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? temporaryValues = prefs.getString(keyPair);
    return temporaryValues == null ? null : int.parse(temporaryValues);
  }

  static Future<bool> getBool({required String keyPair}) async {
    // final String? deviceId = await PlatformDeviceId.getDeviceId;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? temporaryValues = prefs.getString(keyPair);
    final String tempBooleanValues = temporaryValues == null ? 'false' : 'true';
    return tempBooleanValues.toLowerCase() == 'true';
  }
}

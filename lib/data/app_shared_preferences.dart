import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  Future<void> setDateTime(String dateTime) async {
    (await preferences).setString('dateTime', dateTime);
  }
  Future<String?> getDateTime() async {
    return (await preferences).getString('dateTime');
  }

  Future<void> setBatteryLevel(int? batteryLevel) async {
    (await preferences).setInt('battery', batteryLevel ?? -1);
  }
  Future<int?> getBatteryLevel() async {
    return (await preferences).getInt('battery');
  }

  Future<void> setChargingStatus(String? chargingStatus) async {
    (await preferences).setString('charging', chargingStatus ?? 'Can\'t be detected');
  }
  Future<String?> getChargingStatus() async {
    return (await preferences).getString('charging');
  }

  Future<void> setWifiConnectivityState(bool isConnectedToWifi) async {
    (await preferences).setBool('wifiConnection', isConnectedToWifi);
  }
  Future<bool?> getWifiConnectivityState() async {
    return (await preferences).getBool('wifiConnection');
  }

  Future<void> setInternetConnectivityState(bool isConnectionSuccessful) async {
    (await preferences).setBool('internetConnection', isConnectionSuccessful);
  }
  Future<bool?> getInternetConnectivityState() async {
    return (await preferences).getBool('internetConnection');
  }

}
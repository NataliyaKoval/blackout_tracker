import 'dart:io';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppData {
  AndroidBatteryInfo? infoAndroid = AndroidBatteryInfo();

  DateTime getDateAndTime() {
    return DateTime.now();
  }

  Future<int?> getBatteryLevel() async {
    final infoAndroid = await BatteryInfoPlugin().androidBatteryInfo;
    return infoAndroid?.batteryLevel;
  }

  Future<String?> getChargingStatus() async {
    final infoAndroid = await BatteryInfoPlugin().androidBatteryInfo;
    return infoAndroid?.chargingStatus.toString();
  }

  Future<bool> checkWifiConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.wifi;
  }

  Future<bool> tryConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}

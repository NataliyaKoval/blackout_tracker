import 'package:blackout_tracker/data/app_data.dart';
import 'package:blackout_tracker/data/app_shared_preferences.dart';
import 'package:intl/intl.dart';

class Logic {
  AppData appData = AppData();
  AppSharedPreferences appSharedPreferences = AppSharedPreferences();

  String getAndSaveDateAndTime() {
    DateTime dateTime = appData.getDateAndTime();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    appSharedPreferences.setDateTime(formattedDate);
    return formattedDate;
  }

  Future<String?> getAndSaveBatteryLevel() async {
    int? batteryLevel = await appData.getBatteryLevel();
    appSharedPreferences.setBatteryLevel(batteryLevel);
    return batteryLevel.toString();
  }

  Future<String> getAndSaveChargingStatus() async {
    String? chargingStatus = await appData.getChargingStatus();
    appSharedPreferences.setChargingStatus(chargingStatus);
    switch (chargingStatus) {
      case 'ChargingStatus.Unknown':
        return "BATTERY: UNKNOWN!";
      case 'ChargingStatus.Charging':
        return "BATTERY: Charging...";
      case 'ChargingStatus.Full':
        return "BATTERY full";
      case 'ChargingStatus.Unplugged':
        return "unplugged";
      default:
        return "nope";
    }
  }

  Future<String> getAndSaveWifiConnectivityState() async {
    bool isConnectedToWifi = await appData.checkWifiConnectivityState();
    appSharedPreferences.setWifiConnectivityState(isConnectedToWifi);
    return isConnectedToWifi ? 'Connected' : 'No';
  }

  Future<String> getAndSaveInternetConnectivityState() async {
    bool isConnectionSuccessful = await appData.tryConnection();
    appSharedPreferences.setInternetConnectivityState(isConnectionSuccessful);
    return isConnectionSuccessful ? 'Connected' : 'No';
  }
}

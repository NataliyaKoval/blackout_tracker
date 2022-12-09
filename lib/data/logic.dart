import 'package:blackout_tracker/data/app_data.dart';
import 'package:blackout_tracker/data/app_shared_preferences.dart';
import 'package:intl/intl.dart';

class Logic {
  AppData appData = AppData();
  AppSharedPreferences appSharedPreferences = AppSharedPreferences();

  Future<String> getAndSaveDateAndTime() async {
    DateTime dateTime = appData.getDateAndTime();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    await appSharedPreferences.setDateTime(formattedDate);
    return formattedDate;
  }

  Future<String?> getAndSaveBatteryLevel() async {
    int? batteryLevel = await appData.getBatteryLevel();
    await appSharedPreferences.setBatteryLevel(batteryLevel);
    return batteryLevel.toString();
  }

  Future<String> getAndSaveChargingStatus() async {
    String? chargingStatus = await appData.getChargingStatus();
    await appSharedPreferences.setChargingStatus(chargingStatus);
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
    await appSharedPreferences.setWifiConnectivityState(isConnectedToWifi);
    return isConnectedToWifi ? 'Connected' : 'No';
  }

  Future<String> getAndSaveInternetConnectivityState() async {
    bool isConnectionSuccessful = await appData.tryConnection();
    await appSharedPreferences.setInternetConnectivityState(isConnectionSuccessful);
    return isConnectionSuccessful ? 'Connected' : 'No';
  }
}

import 'logic.dart';

class ScheduledTask {

  static void saveAppData() async {
    Logic logic = Logic();
    logic.getAndSaveDateAndTime();
    await logic.getAndSaveBatteryLevel();
    await logic.getAndSaveChargingStatus();
    await logic.getAndSaveWifiConnectivityState();
    await logic.getAndSaveInternetConnectivityState();
  }
}
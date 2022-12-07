import 'package:blackout_tracker/data/logic.dart';
import 'package:blackout_tracker/data/scheduled_task.dart';
import 'package:blackout_tracker/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch(task)
    {
      case 'saveAppData':
        ScheduledTask.saveAppData(); // calls your control code
        break;
    }
    //return Future.value(true);
    return true;
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  Workmanager().registerPeriodicTask(
    "saveAppData",
    "saveAppData",
    frequency: const Duration(hours: 1),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }

  void saveDataToPreferences() {
    Logic logic = Logic();
    logic.getAndSaveDateAndTime();
    logic.getAndSaveBatteryLevel();
    logic.getAndSaveChargingStatus();
    logic.getAndSaveWifiConnectivityState();
    logic.getAndSaveInternetConnectivityState();
  }
}

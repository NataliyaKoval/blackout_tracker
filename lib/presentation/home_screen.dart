import 'package:blackout_tracker/data/logic.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Logic logic = Logic();
  String dateTime = '';
  String batteryLevel = '';
  String chargingStatus = '';
  String wifiConnectivityState = '';
  String internetConnectivityState = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    dateTime = await logic.getAndSaveDateAndTime();
    batteryLevel = (await logic.getAndSaveBatteryLevel())!;
    chargingStatus = await logic.getAndSaveChargingStatus();
    wifiConnectivityState = await logic.getAndSaveWifiConnectivityState();
    internetConnectivityState = await logic.getAndSaveInternetConnectivityState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Date and Time: ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
              Text(dateTime, style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 20,),
              const Text('Battery Level: ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
              Text(batteryLevel, style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 20,),
              const Text('Charging Status: ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
              Text(chargingStatus, style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 20,),
              const Text('Wifi Connectivity State: ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
              Text(wifiConnectivityState.toString(), style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 20,),
              const Text('Internet Connectivity State: ', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
              Text(internetConnectivityState.toString(), style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: getData, child: const Text('Update'),),
            ],
          ),
        ),
      ),
    );
  }
}

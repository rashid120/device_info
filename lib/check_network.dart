import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info/providers/internet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckNetwork extends StatelessWidget {
  const CheckNetwork({super.key});

  Future<String> checkConnectivity() async{

    var checkConnectivity = await Connectivity().checkConnectivity();

    if(checkConnectivity.contains(ConnectivityResult.mobile)) {

      return 'Mobile network';
    } else if(checkConnectivity.contains(ConnectivityResult.wifi)){

      return 'Wi-Fi';
    }else{

      return '...';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => InternetProvider(),

        child: Consumer<InternetProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return StreamBuilder(
              builder: (_, snapshot) {
                InternetProvider().cond();
                return InternetConnection(snapshot: snapshot, widget: const Center(child: Column(
                  children: [
                    Icon(Icons.wifi),
                    Text('Connected'),
                  ],
                )),);
              }, stream: InternetProvider().connectivity,);
          },
        ),
      ),
    );
  }
}

class InternetConnection extends StatelessWidget {

  final AsyncSnapshot snapshot;
  final Widget widget;

  const InternetConnection({super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch(snapshot.connectionState){

      case ConnectionState.active :
        {
          final state = snapshot.data;
          switch (state) {

            case ConnectivityResult.none :
              return design('No internet', Icons.wifi_off);

            default:
              return Scaffold(appBar: AppBar(), body: widget);
          }
        }
      default :
        return design("I don't know", Icons.wifi_find);

    }
  }

  Widget design(String text, IconData icon){
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Icon(icon),
            Text(text),
          ],
        ),
      ),
    );
  }
}


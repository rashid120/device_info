import 'package:device_info/providers/sim_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sim_card_info/sim_card_info.dart';
import 'package:sim_card_info/sim_info.dart';

class SimCardInformation extends StatefulWidget {
  const SimCardInformation({super.key});

  @override
  _SimCardInformationState createState() => _SimCardInformationState();
}

class _SimCardInformationState extends State<SimCardInformation> {

  List<SimInfo>? simData = [];
  // final Telephony telephony = Telephony.instance;
  // var simCard;

  Future<void> getData() async{
    // simCard = await telephony.phoneType;
    SimProvider().getSimInfoFun();
    var sim = SimCardInfo();

    simData = await sim.getSimInfo();
    // simData = SimProvider().simIfo;
  }

  @override
  void initState() {

    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

      create: (BuildContext context) => SimProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: const Text('SIM Card Information'),
        ),
        body: Consumer<SimProvider>(
          builder: (context, simProvider, child) {
            // print('Card view is rebuilt');
            simData = simProvider.simIfo;
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: simProvider.simIfo.isNotEmpty ? Text(simProvider.simIfo.toString()) : const Text("Refresh page"),
                    subtitle: simData!.isEmpty ? const Text('Data is Empty') : Text(simData![index].number),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<SimProvider>(context, listen: false).getSimInfoFun();
            setState(() {
              getData();
            });
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
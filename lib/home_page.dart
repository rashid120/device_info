import 'package:device_info/check_network.dart';
import 'package:device_info/sim_card_info.dart';
import 'package:device_info/social_media.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<AndroidDeviceInfo> getInFo() async{
    return await deviceInfoPlugin.androidInfo;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device information'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: FutureBuilder<AndroidDeviceInfo>(
          future: getInFo(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  cardView(name: 'Brand', value: data!.brand),
                  cardView(name: 'Device', value: data.device),
                  cardView(name: 'Version', value: data.version.release),
                  cardView(name: 'Id', value: data.id),
                  cardView(name: 'Board', value: data.board),
                  cardView(name: 'bootloader', value: data.bootloader),
                  cardView(name: 'Serial Number', value: data.serialNumber),
                  cardView(name: 'Display', value: data.display),
                  cardView(name: 'Fingerprint', value: data.fingerprint),
                  cardView(name: 'Hardware', value: data.hardware),
                  cardView(name: 'Host', value: data.host),
                  cardView(name: 'Manufacture', value: data.manufacturer),
                  cardView(name: 'Model', value: data.model),
                  cardView(name: 'Product', value: data.product),
                  cardView(name: 'Tags', value: data.tags),
                  cardView(name: 'Type', value: data.type),
                  cardView(name: 'All list', value: data.data.toString()),
                ],
              ),
            );
          },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(accountName: Text('Unknown'), accountEmail: Text('unknown@gmail.com')),
            ListTile(
              leading: const Icon(Icons.network_cell),
              title: const Text('Internet'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckNetwork(),)),
            ),
            ListTile(
              leading: const Icon(Icons.sim_card_outlined),
              title: const Text('Sim card info'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SimCardInformation())),
            ),
            ListTile(
              leading: const Icon(Icons.whatshot),
              title: const Text('Open social media'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SocialMedia())),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardView({required String name, required String value}){
    return Card(
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        subtitle: Text(value, style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}

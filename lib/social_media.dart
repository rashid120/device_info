

import 'package:flutter/material.dart';
import 'package:open_share_plus/open.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade500,),
      body: Container(
        margin: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {

              Open.whatsApp(whatsAppNumber: '+918541835544', text: 'Chala ja ..');

            }, child: const Text('Open whatsApp')),

            ElevatedButton(onPressed: () {

              // launchUrl(Uri(path: 'https://www.facebook.com/'),);
              launch("https://www.facebook.com/");

            }, child: const Text('Open Facebook')),
            ElevatedButton(onPressed: () {

              Open.phone(phoneNumber: '8478824808');
            }, child: const Text('Open Phone')),
            ElevatedButton(onPressed: () {

              launch('sms:+918541835544');
            }, child: const Text('Message')),
          ],
        ),
      ),
    );
  }
}

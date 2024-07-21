import 'package:flutter/cupertino.dart';
import 'package:sim_card_info/sim_card_info.dart';
import 'package:sim_card_info/sim_info.dart';

class SimProvider with ChangeNotifier {
  List<SimInfo> simIfo = [];

  Future<void> getSimInfoFun() async {
    try {

      SimCardInfo simCardInfo = SimCardInfo();
      simIfo = (await simCardInfo.getSimInfo())!;
      notifyListeners();

    } catch (e) {

      print('Failed to get SIM info: $e');
    }

  }
}
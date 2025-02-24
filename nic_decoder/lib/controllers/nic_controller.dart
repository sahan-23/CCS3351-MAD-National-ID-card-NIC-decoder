import 'package:get/get.dart';
import '../../models/nic_model.dart';
import '../../utils/nic_decoder.dart';

class NICController extends GetxController {
  var nicModel = NICModel().obs;

  void decodeNIC(String nic) {
    nicModel.value = NICDecoder.decodeNIC(nic);
  }
}

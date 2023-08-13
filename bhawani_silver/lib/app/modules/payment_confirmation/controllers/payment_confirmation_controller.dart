import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
class PaymentConfirmationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> playSound() async {
    AudioPlayer player = AudioPlayer();
    String path = 'sounds/google_pay_sound.mp3';
    await player.play(AssetSource(path)); // Play the audio
  }

}

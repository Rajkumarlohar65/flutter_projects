import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
class OrderConfirmationController extends GetxController {
  // Initialize a RxString to hold the payment ID
  final RxString paymentId = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Retrieve the payment ID from the arguments
    if (Get.arguments != null) {
      paymentId.value = Get.arguments;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<void> playSound() async {
  //   AudioPlayer player = AudioPlayer();
  //   String path = 'sounds/google_pay_sound.mp3';
  //   await player.play(AssetSource(path)); // Play the audio
  // }

}

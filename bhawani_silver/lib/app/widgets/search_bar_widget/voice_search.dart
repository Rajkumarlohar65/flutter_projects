import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceSearchController extends GetxController {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final RxBool _isListening = false.obs;

  RxBool get isListening => _isListening;

  Future<void> startListening(Function(String) onResult) async {
    if (!_speech.isListening) {
      _isListening.value = true;
      bool available = await _speech.initialize(
        onStatus: (status) {
          print("Speech status: $status");
        },
        onError: (error) {
          print("Speech error: $error");
        },
      );

      if (available) {
        _isListening.value = true;
        _speech.listen(
          onResult: (result) {
            if (result.finalResult) {
              onResult(result.recognizedWords);
            }
          },
        );

        // Start a timer for 5 seconds
        Future.delayed(Duration(seconds: 5), () {
          if (_isListening.value) {
            stopListening(); // Call the stopListening method when the timer expires
          }
        });
      } else {
        print("The user has denied speech recognition permissions.");
      }
    } else {
      stopListening(); // Call the stopListening method when the speech recognition is already active
    }
  }

  void stopListening() {
    if (_speech.isListening) {
      _speech.stop();
      _isListening.value = false;
    }
  }
}

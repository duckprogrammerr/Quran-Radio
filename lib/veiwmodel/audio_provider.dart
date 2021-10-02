import 'package:audio_palyer/data/radio_list.dart';
import 'package:audio_palyer/models/radio_model.dart';
import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  late RadioModel _r;
  bool _isPause = false;
  int _isSelected = -1;

  selectedRadio(RadioModel r) {
    int seleted = radios.indexOf(r);
    audioPlayer.play(r.radioUrl);
    _r = r;
    if (_isSelected == seleted) {
      switcher();
    } else {
      _isPause = false;
      _isSelected = seleted;
    }
    notifyListeners();
  }

  switcher() {
    _isPause ? audioPlayer.resume() : audioPlayer.pause();
    _isPause = !_isPause;
    notifyListeners();
  }

  RadioModel get r => _r;
  bool get isPause => _isPause;
  int get isSelected => _isSelected;
}

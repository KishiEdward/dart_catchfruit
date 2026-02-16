import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:fruit_catch/game/managers/audio_manager.dart';

class FruitCatch extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);

  void incrementScore() {
    scoreNotifier.value++;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    AudioManager().playBackgroundMusic();
  }
}

import 'dart:math' ;
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart' ;
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/basket.dart';
import 'components/fruit.dart';
import 'managers/audio_manager.dart';

class FruitCatch extends FlameGame with PanDetector, HasCollisionDetection {
  late Basket basket;
  late TextComponent scoreText;
  final Random random = Random();
  double fruitSpawnTimer = 0.0;
  final double fruitSpawnInterval = 1.5;
  
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

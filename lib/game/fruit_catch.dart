import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FruitCatch extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);

  @override
  Future<void> onLoad() async {}
}

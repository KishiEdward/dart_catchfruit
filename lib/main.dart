import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:fruit_catch/game/fruit_catch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fruit Catch', home: const GameScreen());
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late FruitCatch game;
  @override
  void initState() {
    super.initState();
    game = FruitCatch();
  }

  final ValueNotifier<int> score = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GameWidget(game: game),
                Positioned(
                  //score display
                  top: 50,
                  left: 50,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ValueListenableBuilder<int>(
                      valueListenable: score,
                      builder: (context, value, child) {
                        return Text(
                          'Score: $value',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  //icon buttons
                  top: 50,
                  right: 20,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.music_note),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                score.value++;
              },
              child: const Text("Tambah Score"),
            ),
          ),
        ],
      ),
    );
  }
}

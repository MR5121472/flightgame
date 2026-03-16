import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/flight_game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late FlightGame game;

  @override
  void initState() {
    super.initState();
    game = FlightGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          GameWidget(game: game),

          Positioned(
            bottom: 120,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                game.thrust();
              },
              child: const Text("THRUST"),
            ),
          ),

          Positioned(
            bottom: 120,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                game.brake();
              },
              child: const Text("BRAKE"),
            ),
          ),
        ],
      ),
    );
  }
}
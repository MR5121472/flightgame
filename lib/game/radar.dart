import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'flight_game.dart';

class Radar extends PositionComponent {

  final FlightGame game;

  Radar(this.game);

  @override
  Future<void> onLoad() async {

    size = Vector2(150,150);

    position = Vector2(900,50);
  }

  @override
  void render(Canvas canvas) {

    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      const Offset(75,75),
      70,
      paint,
    );

    canvas.drawCircle(
      const Offset(75,75),
      5,
      Paint()..color = Colors.blue,
    );
  }
}
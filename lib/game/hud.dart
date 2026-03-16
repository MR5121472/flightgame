import 'package:flame/components.dart';
import 'flight_game.dart';

class Hud extends PositionComponent {

  final FlightGame game;

  late TextComponent speedText;
  late TextComponent altitudeText;

  Hud(this.game);

  @override
  Future<void> onLoad() async {

    speedText = TextComponent(
      position: Vector2(20,20),
    );

    altitudeText = TextComponent(
      position: Vector2(20,60),
    );

    add(speedText);
    add(altitudeText);
  }

  @override
  void update(double dt) {

    speedText.text =
        "Speed: ${game.physics.speed.toInt()} KTS";

    altitudeText.text =
        "Altitude: ${game.physics.altitude.toInt()} FT";
  }
}
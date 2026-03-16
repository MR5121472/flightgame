// lib/game/flight_game.dart
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'player_plane.dart';
import 'hud.dart';
import 'radar.dart';
import 'cloud_layer.dart';
import 'runway.dart';
import '../systems/flight_physics.dart';
import '../systems/coins_system.dart';

class FlightGame extends FlameGame with HasCollisionDetection {

  late PlayerPlane player;
  FlightPhysics physics = FlightPhysics();
  CoinsSystem coins = CoinsSystem();

  bool takeoffRewarded = false;
  bool landingRewarded = false;

  @override
  Future<void> onLoad() async {

    // Background
    final sky = await loadSprite("sky.png");
    add(SpriteComponent(
      sprite: sky,
      size: size,
      position: Vector2.zero(),
    ));

    // Clouds
    add(CloudLayer());

    // Runway
    add(Runway());

    // Player Plane
    player = PlayerPlane();
    add(player);

    // HUD and Radar
    add(Hud(this));
    add(Radar(this));
  }

  @override
  void update(double dt) {
    super.update(dt);

    physics.updateAltitude();

    // Move player upward if speed high
    if (physics.speed > 150) {
      player.y -= physics.altitude * 0.0005;
    }

    // --- Takeoff Reward ---
    if (!takeoffRewarded && physics.speed > 150) {
      coins.addCoins(50);
      takeoffRewarded = true;
      print("Takeoff! +50 Coins");
    }

    // --- Landing Reward ---
    if (!landingRewarded && physics.speed < 180 && physics.altitude < 200) {
      coins.addCoins(100);
      landingRewarded = true;
      print("Landing! +100 Coins");
    }
  }

  void thrust() => physics.thrust();
  void brake() => physics.brake();
}
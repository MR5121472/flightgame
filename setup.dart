import 'dart:io';

void main() {
  final projectFolders = [
    'lib/game',
    'lib/ui',
    'lib/systems',
    'lib/ads',
    'assets/images',
    'assets/audio',
  ];

  final projectFiles = {
    'lib/main.dart': '''import 'package:flutter/material.dart';
import 'ui/game_screen.dart';

void main() {
  runApp(const FlightApp());
}

class FlightApp extends StatelessWidget {
  const FlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
''',
    'lib/ui/game_screen.dart': '''import 'package:flutter/material.dart';
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
      body: GameWidget(game: game),
    );
  }
}
''',
    'lib/game/flight_game.dart': '''import 'package:flame/game.dart';

class FlightGame extends FlameGame {
  @override
  Future<void> onLoad() async {}
}
''',
    'lib/game/player_plane.dart': '''class PlayerPlane {}''',
    'lib/game/hud.dart': '''class Hud {}''',
    'lib/game/radar.dart': '''class Radar {}''',
    'lib/game/runway.dart': '''class Runway {}''',
    'lib/game/cloud_layer.dart': '''class CloudLayer {}''',
    'lib/systems/flight_physics.dart': '''class FlightPhysics {}''',
    'lib/systems/coins_system.dart': '''class CoinsSystem {}''',
    'lib/systems/achievements_system.dart': '''class AchievementsSystem {}''',
    'lib/ads/admob_manager.dart': '''class AdMobManager {}''',
  };

  // Create folders
  for (var folder in projectFolders) {
    Directory(folder).createSync(recursive: true);
    print('Created folder: $folder');
  }

  // Create files with boilerplate
  projectFiles.forEach((path, content) {
    File(path).writeAsStringSync(content);
    print('Created file: $path');
  });

  print('✅ Project folder & file structure ready!');
}
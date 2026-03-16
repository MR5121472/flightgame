import 'package:flame/components.dart';

class Runway extends SpriteComponent {

  @override
  Future<void> onLoad() async {

    sprite = await Sprite.load("runway.png");

    size = Vector2(1000, 300);

    position = Vector2(50, 1000);
  }
}
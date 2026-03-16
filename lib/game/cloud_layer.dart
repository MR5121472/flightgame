import 'package:flame/components.dart';

class CloudLayer extends SpriteComponent {

  @override
  Future<void> onLoad() async {

    sprite = await Sprite.load("clouds.png");

    size = Vector2(1200, 600);

    position = Vector2(0, 200);
  }

  @override
  void update(double dt) {

    position.y += 10 * dt;

    if (position.y > 800) {
      position.y = 200;
    }
  }
}
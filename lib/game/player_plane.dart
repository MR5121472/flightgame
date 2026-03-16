import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/collisions.dart';

class PlayerPlane extends SpriteComponent
    with DragCallbacks, CollisionCallbacks {

  @override
  Future<void> onLoad() async {

    sprite = await Sprite.load("plane.png");

    size = Vector2(200, 200);

    anchor = Anchor.center;

    position = Vector2(500, 900);

    add(RectangleHitbox());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {

    position += event.localDelta;

    angle = event.localDelta.x * 0.02;
  }
}
import 'dart:ui';
import 'package:flame/components/component.dart';

class EnemyComponent extends SpriteComponent {
  
  static final componentSize = 40.0;
  static final speed = 120.0;
  static final spriteName = 'dragon.png';

  Size dimensions;
  double maxY;
  bool remove = false;

  EnemyComponent(this.dimensions) : super.square(componentSize, spriteName);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override 
  void update(double t) {
    y += t * speed;

    if (y > dimensions.height) {
      remove = true;
    }
  }

  @override
  bool destroy() {
    return remove;
  }

  @override
  void resize(Size size) {
    this.x = size.width / 2;
    //this.y = y;
    this.maxY = size.height;
  }
}

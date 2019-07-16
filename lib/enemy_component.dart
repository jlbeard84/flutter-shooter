import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:shootergame/globals.dart';
import 'constants.dart';

class EnemyComponent extends SpriteComponent {

  Size dimensions;
  int position;
  int yPosition;

  double maxY;
  bool explode = false;

  EnemyComponent(this.dimensions, this.position, this.yPosition) 
    : super.square(enemyComponentSize, enemySpriteName);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override 
  void update(double t) {
    y += gameOver ? 0 : (t * enemySpeed);
  }

  @override
  bool destroy() {
    if (explode) {
      return true;
    } else if (y == null || maxY == null) {
      return false;
    }

    var shouldDestroy = y >= maxY + enemyComponentSize / 2;

    if (shouldDestroy) {
      gameOver = true;

      print ("Game Over");
    }

    return shouldDestroy;
  }

  @override
  void resize(Size size) {
    this.x = enemyComponentSize * position;
    this.y = enemyComponentSize * yPosition;
    this.maxY = size.height;
  }
}

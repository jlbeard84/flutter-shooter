import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:shootergame/enemy_component.dart';
import 'package:shootergame/globals.dart';
import 'constants.dart';
import 'explosion.dart';

class Bullet extends SpriteComponent {
  bool explode = false;
  double maxY;

  List<EnemyComponent> enemies = new List<EnemyComponent>();
  List<Bullet> bullets = new List<Bullet>();

  Bullet(this.enemies, this.bullets)
    : super.square(bulletSize, bulletSpriteName);

  @override
  void update(double t) {
    y -= gameOver
      ? 0
      : t * bulletSpeed;

    if (enemies.isNotEmpty) {
      var bulletRect = this.toRect();

      enemies.forEach((enemy) {
        var enemyRect = enemy.toRect();

        var shouldRemove = bulletRect.contains(enemyRect.bottomCenter) || 
          bulletRect.contains(enemyRect.bottomLeft) ||
          bulletRect.contains(enemyRect.bottomRight);

        if (shouldRemove) {
          points++;
          enemy.explode = true;
          this.explode = true;
          enemies.remove(enemy);

          game.add(new Explosion(enemy));
        }
      });
    }
  }

  @override
  bool destroy() {
    if (explode) {
      return true;
    }

    if (y == null || maxY == null) {
      return false;
    }

    var destroy = y >= maxY;
    return destroy;
  }

  @override
  void resize(Size size) {
    this.x = touchPositionDx;
    this.y = touchPositionDy;
    this.maxY = size.height;
  }
}

import 'package:flame/components/animation_component.dart';
import 'package:shootergame/constants.dart';
import 'package:shootergame/enemy_component.dart';

class Explosion extends AnimationComponent {
  static final defaultTextureSize = 31.0;
  static final animationSpeed = 0.75;
  static final animationFactor = 7;

  Explosion(EnemyComponent enemy) 
    : super.sequenced(
      enemyComponentSize, 
      enemyComponentSize, 
      explosionSpriteName,
      7,
      textureWidth: defaultTextureSize,
      textureHeight: defaultTextureSize) {

      this.x = enemy.x;
      this.y = enemy.y;
      this.animation.stepTime = animationSpeed / animationFactor;
    }

    bool destroy() {
      return this.animation.isLastFrame;
    }
}

import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'enemy_component.dart';

class GameApp extends BaseGame {

  Size dimensions;
  double creationTimer = 0;

  GameApp(this.dimensions);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    var text = "Score 0";

    var textPainter = Flame.util.text(text, color: Colors.white, fontSize: 42.0);
    textPainter.paint(canvas, Offset((size.width / 2) - (textPainter.width / 2), size.height - 50));
  }

  @override
  void update(double t) {
    creationTimer += t;

    if (creationTimer >4 ) {
      creationTimer = 0;

      var enemyComponent = new EnemyComponent(dimensions);
      add(enemyComponent);
    }

    super.update(t);
  }
}
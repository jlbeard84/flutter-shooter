import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:shootergame/constants.dart';
import 'package:shootergame/globals.dart';

import 'enemy_component.dart';

class GameApp extends BaseGame {

  Size dimensions;
  double creationTimer = 0;
  List<EnemyComponent> enemies = new List<EnemyComponent>();

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

    if (gameOver) {
      return;
    }
    
    creationTimer += t;

    if (creationTimer >= 4 ) {
      creationTimer = 0;

      for (var i = 0; i < enemyComponentSize / 7; i++) {
        for (var j = 0; j < i; j++) {
          var enemy = new EnemyComponent(dimensions, i , j);
          enemies.add(enemy);
          add(enemy);
        }
      }
    }

    super.update(t);
  }
}
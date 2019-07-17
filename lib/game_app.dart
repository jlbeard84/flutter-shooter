import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:shootergame/constants.dart';
import 'package:shootergame/globals.dart';
import 'bullet.dart';
import 'enemy_component.dart';

class GameApp extends BaseGame {

  static final gameOverText = "Game Over";

  Size dimensions;
  double creationTimer = 0;

  List<EnemyComponent> enemies = new List<EnemyComponent>();
  List<Bullet> bullets = new List<Bullet>();

  GameApp(this.dimensions);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    
    var scoreText = "Score $points";

    var scoreTextPainter = Flame.util.text(scoreText, color: Colors.white, fontSize: 42.0);
    scoreTextPainter.paint(canvas, Offset((size.width / 2) - (scoreTextPainter.width / 2), size.height - 50));

    if (gameOver) {
      var gameOverPainter = Flame.util.text(gameOverText, color: Colors.white, fontSize: 42.0);
      gameOverPainter.paint(canvas, Offset((size.width / 2) - (gameOverPainter.width / 2), 50));
    }
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

  void tapInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    bulletStartStop = true;

    if (!gameOver) {
      var bullet = new Bullet(enemies, bullets);
      bullets.add(bullet);
      add(bullet);
    }
  }

  void dragInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    bulletStartStop = true;
  }

  void onUp() {
    bulletStartStop = false;
  }
}
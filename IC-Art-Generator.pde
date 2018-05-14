final int GRID_SIZE = 15;
final boolean SHOW_GRID = true;

class Chip {
  int gridSize, width, height;
  Path[] paths;
  Chip(int gridSize, int width, int height) {
    this.gridSize = gridSize;
    this.width = width;
    this.height = height;
    paths = new Path[(width-1)*2 + (height-1)*2];
    int j = 0;
    for (int i = 0; i < width-1; i++) {
      paths[j++] = new Path(gridSize, Side.TOP);
    }
    for (int i = 0; i < height-1; i++) {
      paths[j++] = new Path(gridSize, Side.RIGHT);
    }
    for (int i = 0; i < width-1; i++) {
      paths[j++] = new Path(gridSize, Side.BOTTOM);
    }
    for (int i = 0; i < height-1; i++) {
      paths[j++] = new Path(gridSize, Side.RIGHT);
    }
  }
  void draw() {
    rect(-width/2*gridSize, -height/2*gridSize, width*gridSize, height*gridSize);
    int j = 0;
    for (int i = 0; i < width-1; i++) {
      pushMatrix();
      translate(-width/2*gridSize + (i+1)*gridSize, -height/2*gridSize);
      paths[j++].drawRandomly();
      popMatrix();
    }
    for (int i = 0; i < height-1; i++) {
      pushMatrix();
      translate(width/2*gridSize, -height/2*gridSize + (i+1)*gridSize);
      rotate(PI*0.5);
      paths[j++].drawRandomly();
      popMatrix();
    }
    for (int i = 0; i < width-1; i++) {
      pushMatrix();
      translate(-width/2*gridSize + (i+1)*gridSize, height/2*gridSize);
      rotate(PI);
      paths[j++].drawRandomly();
      popMatrix();
    }
    for (int i = 0; i < height-1; i++) {
      pushMatrix();
      translate(-width/2*gridSize, -height/2*gridSize + (i+1)*gridSize);
      rotate(PI*1.5);
      paths[j++].drawRandomly();
      popMatrix();
    }
  }
}

enum Side {
  TOP, RIGHT, BOTTOM, LEFT;
}

enum Direction {
  LEFT, STRAIGHT, RIGHT;
  Direction turnLeft() {
    switch (this) {
      case STRAIGHT:
        return LEFT;
      case RIGHT:
        return STRAIGHT;
      default:
        return LEFT;
    }
  }
  Direction turnRight() {
    switch (this) {
      case LEFT:
        return STRAIGHT;
      case STRAIGHT:
        return RIGHT;
      default:
        return RIGHT;
    }
  }
}

Direction randomDirectionExceptFor(Direction oldD) {
  Direction newD;
  do {
    newD = Direction.values()[floor(random(0f, Direction.values().length))];
  } while (newD == oldD);
  return newD;
}


class Path {
  int gridSize;
  Side side;
  Path(int gridSize, Side side) {
    this.gridSize = gridSize;
    this.side = side;
  }
  private void gridLine(int x0, int y0, int x1, int y1) {
    line(x0*gridSize, y0*gridSize, x1*gridSize, y1*gridSize);
  }
  void drawRandomly() {
    int x = 0, y = 0;
    gridLine(x, y, x, --y);
    Direction direction = Direction.STRAIGHT;
    int len = ceil(random(4f, 12f));
    for (int i = 0; i < len; i++) {
      if (random(1f) > 0.8f) { // change direction
        direction = randomDirectionExceptFor(direction);
      }
      switch (direction) {
        case LEFT:
          gridLine(x, y, --x, y);
          break;
        case STRAIGHT:
          gridLine(x, y, x, --y);
          break;
        case RIGHT:
          gridLine(x, y, ++x, --y);
          break;
      }
    }
  }
}

void drawGrid(int radius) {
  for (int x = -radius; x <= radius; x++) {
    for (int y = -radius; y <= radius; y++) {
      point(x*GRID_SIZE, y*GRID_SIZE);
    }
  }
}

void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  
  pushMatrix();
  translate(250, 250);
  if (SHOW_GRID) drawGrid(30);
  Chip c = new Chip(GRID_SIZE, 8, 8);
  c.draw();
  popMatrix();
 
}

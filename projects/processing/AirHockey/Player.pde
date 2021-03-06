
class Player {
  float x, y, r, px, py, inter_x, inter_y, speed;
  Player(float _x, float _y, float _r) {
    x = _x;
    y = _y;
    r = _r;
    px = _x;
    py = _y;
  }

  void show() {
    //noStroke();
    fill(255);
    float d = 2 * r;
    ellipse(x, y, d, d);
    fill(51);
    ellipse(x, y, 0.8*d, 0.8*d);
    fill(255);
    ellipse(x, y, 0.6*d, 0.6*d);
  }

  void update(float _x, float _y, Ball b) {
    x = _x;
    y = _y;
    update_speed();
    if(is_intersect(b.x, b.y, b.r)){
      impact(b);
    }
  }

  void update_speed() {
    speed = 2 * dist(px, py, x, y); // Speed is distance between old cord and new
    px = x;
    py = y;
  }
  
  boolean is_intersect(float _x, float _y, float _r) { // Check for intersection
    return dist(x, y, _x, _y) < r + _r;
  }
  
  void impact(Ball b){  // Change moving vector of ball
    b.v.x = map(b.x - x, -b.r, b.r, -1, 1); // new vector.x is old.x - player.x
    b.v.y = map(b.y - y, -b.r, b.r, -1, 1); // same for y
    b.speed = map(speed, 0, 2*width, 0.3, width / 2); // ball's speed changes as player's
  }
}

abstract class Shape {
  double getArea();
}

class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double getArea() {
    return width * height;
  }
}

class Square implements Shape {
  double side;

  Square(this.side);

  @override
  double getArea() {
    return side * side;
  }
}




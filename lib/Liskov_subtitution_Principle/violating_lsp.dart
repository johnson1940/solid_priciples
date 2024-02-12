///Object of the super classes should be replaceable with the object of the subclasses without breaking
///Square inherits from Rectangle, both representing shapes with width and height.
///However, overriding both width and height setters in Square forces them to always have the same value,
/// essentially making it a fixed-size square.
/// This differs from the general Rectangle behavior where width and height can be set independently.
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double getArea() {
    return width * height;
  }
}

class Square extends Rectangle {
  Square(double side) : super(side, side);

  // Overriding to maintain square properties
  @override
  double getArea() {
    return width * width;
  }

  // Violating LSP by overriding setters
  @override
  set width(double value) {
    super.width = value;
    super.height = value;
  }

  @override
  set height(double value) {
    super.width = value;
    super.height = value;
  }
}



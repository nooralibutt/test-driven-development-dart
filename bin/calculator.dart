class Calculator {
  int add(int num1, int num2) => num1 + num2;
  int subtract(int num1, int num2) => num1 - num2;

  int multiply(int num1, int num2) {
    int result = 0;
    for (int i = 0; i < num1.abs(); i++) {
      result += num2.abs();
    }

    if (num1 < 0 && num2 > 0 || num2 < 0 && num1 > 0) {
      result = result - result - result;
    }

    return result;
  }
}

class CounterManager {
  static int counter = 0;

  static void incrementCounter() {
    counter++;
  }

  static void decrementCounter() {
    if (counter > 0) {
      counter--;
    }
  }
}

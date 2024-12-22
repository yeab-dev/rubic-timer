class ObservationTimer {
  const ObservationTimer();

  Stream<int> start({required int ticks}) {
    return Stream.periodic(
      Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(15);
  }
}

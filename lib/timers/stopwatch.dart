class StopWatch {
  const StopWatch();
  Stream<int> start() {
    return Stream.periodic(
      Duration(milliseconds: 1),
      (x) => x,
    );
  }
}

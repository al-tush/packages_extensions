DateTime start = DateTime(2000);
DateTime end = DateTime(2000);

void millisecondsPerformance(String methodDescription, Function method) {
  start = DateTime.now();
  method();
  end = DateTime.now();

  print('Perfomance $methodDescription = ms'
      ' ${end.difference(start).inMilliseconds}');
}

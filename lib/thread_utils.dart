class Pair<T1, T2> {
  T1 first;
  T2 second;

  Pair(this.first, this.second);
}

Future<Pair<T1, T2>> concatenateFutures<T1, T2>(Future<T1> one, Future<T2> two) async {
  T1 first = await one;
  T2 second = await two;
  return Pair(first, second);
}
import 'dart:async';

class Debouncer {
  final int millisecound;
  Timer? _timer;

  Debouncer({required this.millisecound});


  void run(void Function() action){
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: millisecound), action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
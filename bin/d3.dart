import 'dart:io';

class Clock {
  List<ClockState> state = [
    IdleState(),
    SettingHoursState(),
    SettingMinsState()
  ];
  int currentState = 0;
  int hour;
  int minute;
  Clock(this.hour, this.minute);

  void turnOn() {
    state[currentState].turnOn(this);
  }

  void set() {
    state[currentState].set(this);
  }

  void inc() {
    state[currentState].inc(this);
  }

  void changeState(int index) {
    currentState = index;
  }

  @override
  String toString() {
    return ('${hour.toString()} : ${minute.toString()}');
  }
}

abstract class ClockState {
  void turnOn(Clock clock) {}

  void set(Clock clock) {}

  void inc(Clock clock) {}
}

class IdleState extends ClockState {
  @override
  void turnOn(Clock clock) {
    if (clock.hour != 0 || clock.minute != 0) {
      print(clock);
    } else
      // ignore: curly_braces_in_flow_control_structures
      set(clock);
  }

  @override
  void set(Clock clock) {
    clock.changeState(1);
  }
}

class SettingHoursState extends ClockState {
  @override
  void inc(Clock clock) {
    clock.hour = (clock.hour + 1) % 24;
    print(clock);
  }

  @override
  void set(Clock clock) {
    clock.changeState(2);
  }
}

class SettingMinsState extends ClockState {
  @override
  void inc(Clock clock) {
    clock.minute = (clock.minute + 1) % 60;
    print(clock);
  }

  @override
  void set(Clock clock) {
    clock.changeState(0);
  }
}

String input = '''
on 18 0
set 
inc 
set 
inc 
set 
inc 
inc 
set 
''';

void main(List<String> arguments) {
  // var time = (stdin.readLineSync() ?? '').split(' ');
  // print(time);

  // Clock clock;

  var line = input.split('\n');
  var first_line = line[0].split(' ');
  var clock;

  if (first_line[1] == 0 && first_line[2] == 0) {
    clock = Clock(0, 0);
  } else {
    clock = Clock(int.parse(first_line[1]), int.parse(first_line[2]));
  }

  clock.turnOn();

  for (var i = 0; i < line.length; i++) {
    if (line[i] == 'set') {
      clock.set();
    } else if (line[i] == 'inc') {
      clock.inc();
    }
  }
}

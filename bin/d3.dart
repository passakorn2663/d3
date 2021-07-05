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
}

abstract class ClockState {
  void turnOn(Clock clock) {}

  void set(Clock clock) {}

  void inc(Clock clock) {}
}

class IdleState extends ClockState {
  @override
  void turnOn(Clock clock) {
    if (clock.hour != 0 && clock.minute != 0) {
      print(clock.hour + clock.minute);
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
  }

  @override
  void set(Clock clock) {
    clock.changeState(0);
  }
}

void main(List<String> arguments) {
  var time = (stdin.readLineSync() ?? '').split(' ');
  print(time);
  int a = 18;
  print(a % 18);
}

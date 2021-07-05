import 'dart:io';

class Clock {
  int hour;
  int minute;
  Clock(this.hour, this.minute);

  // void hourIncrement() {
  //   hour = (hour + 1) % 24;
  // }

  // void minIncrement() {
  //   minute = (minute + 1) % 60;
  // }
}

abstract class ClockState {
  final int hour;
  final int minute;
  ClockState(this.hour, this.minute);
  void turnOn(Clock clock) {}

  void set(Clock clock) {}

  void inc(Clock clock) {}
}

class IdleState extends ClockState {
  IdleState(int hour, int minute) : super(hour, minute);
}

class SettingHoursState extends ClockState {
  SettingHoursState(int hour, int minute) : super(hour, minute);

  @override
  void inc(Clock clock) {
    clock.hour = (clock.hour + 1) % 24;
  }
}

class SettingMinsState extends ClockState {
  SettingMinsState(int hour, int minute) : super(hour, minute);

  @override
  void inc(Clock clock) {
    clock.minute = (clock.minute + 1) % 60;
  }
}

void main(List<String> arguments) {
  var time = (stdin.readLineSync() ?? '').split(' ');
  print(time);
}

void set(int curNum) {}

void inc(int hour, int minute) {}

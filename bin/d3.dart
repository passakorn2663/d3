abstract class ClockState {
  final int hour;
  final int minute;
  ClockState(this.hour, this.minute);
}

class IdleState extends ClockState {
  IdleState({hours, minute}) : super(hours = 0, minute = 0);
}

class SettingHoursState extends ClockState {
  SettingHoursState({hours, minute}) : super(hours = 0, minute = 0);
}

class SettingMinsState extends ClockState {
  SettingMinsState({hours, minute}) : super(hours = 0, minute = 0);
}

void main(List<String> arguments) {
  print('Hello world!');
}

void set(int curNum) {}

void inc(int hour, int minute) {}

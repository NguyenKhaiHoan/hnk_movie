extension IntExtension on int {
  String toHoursMinutes() {
    int hours = this ~/ 60;
    int minutes = this % 60;

    return '${hours}h ${minutes}m';
  }
}

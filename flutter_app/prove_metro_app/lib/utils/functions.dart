import '../models/activity.dart';

String formatDayTime(Activity activity) {
  try {
    // Tomar la hora como string "HH:mm"
    final parts = activity.hora.split(":");
    int hour = int.parse(parts[0]);
    final int minute = parts.length > 1 ? int.parse(parts[1]) : 0;

    // Determinar AM/PM
    String suffix = "AM";
    if (hour >= 12) {
      suffix = "PM";
      if (hour > 12) hour -= 12;
    } else if (hour == 0) {
      hour = 12; // medianoche
    }

    final String minuteStr = minute.toString().padLeft(2, '0');
    final String timeFormatted = "$hour:$minuteStr $suffix";

    // Combinar con el día
    return "${activity.dia}, $timeFormatted";
  } catch (e) {
    return "${activity.dia} • ${activity.hora}";
  }
}
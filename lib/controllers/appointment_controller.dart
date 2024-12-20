class AppointmentController {
  DateTime selectedDate = DateTime.now();  // Default to the current date if not set
  int? selectedHour = 9;  // Default to 9 AM
  int? selectedMinute = 0;  // Default to 0 minutes

  void setDate(DateTime date) {
    selectedDate = date;
  }

  void setHour(int hour) {
    selectedHour = hour;
  }

  void setMinute(int minute) {
    selectedMinute = minute;
  }

  void rescheduleAppointment() {
    if (selectedDate != null && selectedHour != null && selectedMinute != null) {
      // Proceed with rescheduling logic
      print("Rescheduled to: ${selectedDate.toLocal()} ${selectedHour}:${selectedMinute}");
    } else {
      throw Exception("Unexpected null value: Unable to reschedule");
    }
  }
}

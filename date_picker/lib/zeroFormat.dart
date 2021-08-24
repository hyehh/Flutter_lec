class ZeroFormat{ // 숫자 포맷 변경시키기

  String monthZero(int month) {
    String workMonth = "";
    if (month < 10) {
      workMonth = "0$month";
    }else {
      workMonth = "$month";
    }
    return workMonth;
  }

  String dayZero(int day) {
    String workDay = "";
    if (day < 10) {
      workDay = "0$day";
    }else {
      workDay = "$day";
    }
    return workDay;
  }

  String hourZero(int hour) {
    String hourDay = "";
    if (hour < 10) {
      hourDay = "0$hour";
    }else {
      hourDay = "$hour";
    }
    return hourDay;
  }

  String minuteZero(int minute) {
    String minuteDay = "";
    if (minute < 10) {
      minuteDay = "0$minute";
    }else {
      minuteDay = "$minute";
    }
    return minuteDay;
  }

  String secondZero(int second) {
    String secondDay = "";
    if (second < 10) {
      secondDay = "0$second";
    }else {
      secondDay = "$second";
    }
    return secondDay;
  }

}
enum Submission {
  success,
  failure,
  initial,
  loading,
  dataFound,
  createNew,
  editing,
  successStep,
}

enum DateRangeEnum {
  date_1w,
  date_1m,
  date_6m,
  // date_1y,
}

extension DateRangeEnumX on DateRangeEnum {
  String get stringName {
    switch (this) {
      case DateRangeEnum.date_1w:
        return 'اخر اسبوع';
      case DateRangeEnum.date_1m:
        return 'اخر شهر';
      case DateRangeEnum.date_6m:
        return 'اخر ستة اشهر';
      // case DateRangeEnum.date_1y:
      //   return 'اخر سنة';
    }
  }

  DateTime get getDate {
    switch (this) {
      case DateRangeEnum.date_1w:
        return DateTime.now().subtract(const Duration(days: 7));
      case DateRangeEnum.date_1m:
        return DateTime(
            DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
      case DateRangeEnum.date_6m:
        return DateTime(
            DateTime.now().year, DateTime.now().month - 6, DateTime.now().day);
      // case DateRangeEnum.date_1y:
      //   return DateTime(
      //       DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
    }
  }
}

enum AgeRangeEnum {
  less_18,
  from18_34,
  from35_50,
  more_50,
}

extension AgeRangeEnumX on AgeRangeEnum {
  String get stringName {
    switch (this) {
      case AgeRangeEnum.less_18:
        return '< 18';
      case AgeRangeEnum.from18_34:
        return '18 - 34';
      case AgeRangeEnum.from35_50:
        return '35 - 50';
      case AgeRangeEnum.more_50:
        return '> 50';
    }
  }
}

enum DataStatus {
  loadingData,
  initialData,
  getData,
  errorData,
}

enum NotificationStatus {
  noData,
  hasData,
  searching,
  loading,
  errorData,
  initial
}

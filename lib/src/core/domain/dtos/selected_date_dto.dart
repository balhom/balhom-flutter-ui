import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Selected date class.
class SelectedDateDto extends Equatable {
  final int day;
  final int month;
  final int year;
  final SelectedDateEnum selectedDateMode;

  DateTime get dateFrom {
    if (selectedDateMode == SelectedDateEnum.month) {
      return DateTime(year, month, 1);
    } else if (selectedDateMode == SelectedDateEnum.year) {
      return DateTime(year, 1, 1);
    }
    return DateTime(year, month, day);
  }

  DateTime get dateTo {
    if (selectedDateMode == SelectedDateEnum.month) {
      return DateTime(year, month, DateUtils.getDaysInMonth(year, month));
    } else if (selectedDateMode == SelectedDateEnum.year) {
      return DateTime(year, 12, DateUtils.getDaysInMonth(year, month));
    }
    return DateTime(year, month, day);
  }

  const SelectedDateDto({
    required this.day,
    required this.month,
    required this.year,
    required this.selectedDateMode,
  });

  @override
  List<Object?> get props => [day, month, year];

  SelectedDateDto copyWith({
    int? day,
    int? month,
    int? year,
    SelectedDateEnum? selectedDateMode,
  }) {
    return SelectedDateDto(
        day: day ?? this.day,
        month: month ?? this.month,
        year: year ?? this.year,
        selectedDateMode: selectedDateMode ?? this.selectedDateMode);
  }
}

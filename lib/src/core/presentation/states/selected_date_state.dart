import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedDateState extends StateNotifier<SelectedDateDto> {
  SelectedDateState(SelectedDateEnum selectedDateMode)
      : super(SelectedDateDto(
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
            selectedDateMode: selectedDateMode));

  void setSelectedDate(SelectedDateDto selectedDate) {
    state = selectedDate;
  }

  void setMonth(int month) {
    state = state.copyWith(month: month);
  }

  void setYear(int year) {
    state = state.copyWith(year: year);
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_suit/features/rental/logic/cubit/rental_state.dart';

class RentalCubit extends Cubit<RentalState> {
  final double suitPrice;

  RentalCubit({required this.suitPrice})
    : super(
        RentalState(
          startDate: DateTime.now(),
          rentalDays: 1,
          rentalPricePerDay: suitPrice * 0.12,
        ),
      );

  void selectStartDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: state.startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.black,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != state.startDate) {
      emit(state.copyWith(startDate: picked));
    }
  }

  void increaseDays() {
    emit(state.copyWith(rentalDays: state.rentalDays + 1));
  }

  void decreaseDays() {
    if (state.rentalDays > 1) {
      emit(state.copyWith(rentalDays: state.rentalDays - 1));
    }
  }

  double get totalPrice => state.rentalPricePerDay * state.rentalDays;

  String get formattedDate => DateFormat.yMMMd().format(state.startDate);
}

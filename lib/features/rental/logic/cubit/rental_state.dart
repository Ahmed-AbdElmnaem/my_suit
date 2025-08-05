class RentalState {
  final DateTime startDate;
  final int rentalDays;
  final double rentalPricePerDay;

  RentalState({
    required this.startDate,
    required this.rentalDays,
    required this.rentalPricePerDay,
  });

  RentalState copyWith({
    DateTime? startDate,
    int? rentalDays,
    double? rentalPricePerDay,
  }) {
    return RentalState(
      startDate: startDate ?? this.startDate,
      rentalDays: rentalDays ?? this.rentalDays,
      rentalPricePerDay: rentalPricePerDay ?? this.rentalPricePerDay,
    );
  }
}

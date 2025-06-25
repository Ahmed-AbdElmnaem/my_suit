import 'package:my_suit/features/rental/data/model/rental_model.dart';

abstract class RentalRepo {
  Future<List<RentalModel>> getAvailableRentals();
}

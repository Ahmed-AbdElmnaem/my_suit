import 'package:my_suit/features/rental/data/model/rental_model.dart';
import 'package:my_suit/features/rental/data/repo/rental_repo.dart';

class RentalFakeRepo implements RentalRepo {
  @override
  Future<List<RentalModel>> getAvailableRentals() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      RentalModel(
        suitName: "بدلة كلاسيك",
        dailyPrice: 150,
        image: "assets/images/classic.png",
      ),
      RentalModel(
        suitName: "بدلة فورمال",
        dailyPrice: 200,
        image: "assets/images/formal.png",
      ),
    ];
  }
}

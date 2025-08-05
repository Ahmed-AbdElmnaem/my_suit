import 'package:my_suit/features/home/data/model/suit_model.dart';

abstract class PurchaseRepository {
  Future<void> purchaseSuit({required SuitModel suit});
}

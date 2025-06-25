import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/purchase/data/repo/purchase_repository.dart';

class FakePurchaseRepository implements PurchaseRepository {
  @override
  Future<void> purchaseSuit({required SuitModel suit}) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate delay
    print('Purchased ${suit.name} ');
  }
}

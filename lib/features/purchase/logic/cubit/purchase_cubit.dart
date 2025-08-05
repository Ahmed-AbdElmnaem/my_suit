import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_suit/features/home/data/model/suit_model.dart';
import 'package:my_suit/features/purchase/data/repo/purchase_repository.dart';
import 'package:my_suit/features/purchase/logic/cubit/purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final PurchaseRepository repo;

  PurchaseCubit(this.repo) : super(PurchaseInitial());

  Future<void> purchaseSuit(SuitModel suit) async {
    emit(PurchaseLoading());
    try {
      await repo.purchaseSuit(suit: suit);
      emit(PurchaseSuccess());
    } catch (e) {
      emit(PurchaseError("Purchase failed: ${e.toString()}"));
    }
  }
}

sealed class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {}

class PurchaseError extends PurchaseState {
  final String message;

  PurchaseError(this.message);
}

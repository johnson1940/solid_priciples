import 'package:flutter/foundation.dart';
/// This class provides methods for different payment methods,
/// but if you need to add a new payment method (e.g., PayPal), you need to modify the PaymentService class directly.
/// This violates the OCP because modifying the class for new functionalities can lead to potential regressions or introduce tight coupling.
/// Changes made in one part of the codebase can unintentionally affect other parts, leading to unexpected behavior.
/// Adding new features or modifying existing ones becomes difficult and time-consuming, as it requires changes in multiple places throughout the codebase.
/// Modifications to existing code can introduce new bugs or affect the behavior of other components

class PaymentService {
  void payWithCash(double amount) {
    if (kDebugMode) {
      print('Paying $amount with cash');
    }
  }

  void payWithCreditCard(double amount, String cardNumber) {
    if (kDebugMode) {
      print('Paying $amount with credit card $cardNumber');
    }
  }

  void payWithBitcoin(double amount, String walletAddress) {
    if (kDebugMode) {
      print('Paying $amount with Bitcoin wallet $walletAddress');
    }
  }


}
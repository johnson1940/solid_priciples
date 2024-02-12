import 'package:flutter/foundation.dart';

/// adding a new payment method involves creating a new class implementing the PaymentMethod interface without modifying the PaymentService
/// Adding new payment methods requires minimal code changes.
/// Changes to one payment method don't affect others.
/// Each payment method can be tested independently.

abstract class PaymentMethod {
  double amount;

  PaymentMethod(this.amount);

  void pay();
}

class CashPayment extends PaymentMethod {
  CashPayment(double amount) : super(amount);

  @override
  void pay() {
    if (kDebugMode) {
      print('Paying $amount with cash');
    }
  }
}

class CreditCardPayment extends PaymentMethod {
  final String cardNumber;

  CreditCardPayment(double amount, this.cardNumber) : super(0.0);

  @override
  void pay() {
    if (kDebugMode) {
      print('Paying $amount with credit card $cardNumber');
    }
  }
}

class BitCoinPayment extends PaymentMethod {
  final String bitcoinAddress;

  BitCoinPayment(double amount, this.bitcoinAddress) : super(0.0);

  @override
  void pay() {
    if (kDebugMode) {
      print('Paying $amount with credit card $bitcoinAddress');
    }
  }
}

class PaymentService {
  void pay(PaymentMethod method) {
    method.pay();
  }
}

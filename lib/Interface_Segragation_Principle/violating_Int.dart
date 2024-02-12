///Clients should not be forced to depend on interfaces they do not use.

abstract class PaymentMethods{
  void upi();
  void scan();
  void creditCard();
  void debitCard();
  void cashOnDelivery();
}

/// This cashOnDelivery class need only method to be used from the PaymentMethods that is cashOndDelivery()
/// Others are not need and remains unused violating the ISP
class CashOnDelivery implements PaymentMethods {
  @override
  void cashOnDelivery() {
    // TODO: implement cashOnDelivery
  }

  @override
  void creditCard() {
    // TODO: implement creditCard
  }

  @override
  void debitCard() {
    // TODO: implement debitCard
  }

  @override
  void scan() {
    // TODO: implement scan
  }

  @override
  void upi() {
    // TODO: implement upi
  }

}

class NetBanking implements PaymentMethods {

  @override
  void cashOnDelivery() {
    // TODO: implement cashOnDelivery
  }

  @override
  void creditCard() {
    // TODO: implement creditCard
  }

  @override
  void debitCard() {
    // TODO: implement debitCard
  }

  @override
  void scan() {
    // TODO: implement scan
  }

  @override
  void upi() {
    // TODO: implement upi
  }

}
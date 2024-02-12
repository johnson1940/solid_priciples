abstract class CashOnDeliveryMethods{
  void cashOnDelivery();
}

abstract class OnlinePaymentMethods {
  void upi();
  void scan();
  void creditCard();
  void debitCard();
}


class CashOnDelivery implements CashOnDeliveryMethods {
  @override
  void cashOnDelivery() {
    // TODO: implement cashOnDelivery
  }
}

class NetBanking implements OnlinePaymentMethods {

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
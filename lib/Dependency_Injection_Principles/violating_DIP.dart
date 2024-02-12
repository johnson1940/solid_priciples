

/// low level module
class EmailService {
  void sendEmail(String to, String message) {
    print('Sending email to $to: $message');
  }
}

class SMSService {
  void sendSMS(String to, String message) {
    print('Sending SMS to $to: $message');
  }
}

/// High level module
class MessagingSystem {
  final EmailService _emailService;
  final SMSService _smsService;

  MessagingSystem(this._emailService, this._smsService);

  void sendEmailMessage(String to, String message) {
    _emailService.sendEmail(to, message);
  }

  void sendSMSMessage(String to, String message) {
    _smsService.sendSMS(to, message);
  }
}

void main() {
  var emailService = EmailService();
  var smsService = SMSService();

  var messagingSystem = MessagingSystem(emailService, smsService);
  messagingSystem.sendEmailMessage('recipient@example.com', 'Hello, via email!');

  messagingSystem.sendSMSMessage('555-123-4567', 'Hello, via SMS!');
}

// Abstraction for message services
abstract class MessageService {
  void sendMessage(String to, String message);
}

// Concrete implementations of message services
class EmailService implements MessageService {
  @override
  void sendMessage(String to, String message) {
    // Send an email...
  }
}

class SMSService implements MessageService {
  @override
  void sendMessage(String to, String message) {
    // Send an SMS...
  }
}

// MessagingSystem depends on abstractions (DIP adhered)
class MessagingSystem {
  late MessageService messageService;

  // Dependency injection of the message service
  MessagingSystem(this.messageService);

  void sendMessage(String to, String message) {
    messageService.sendMessage(to, message);
  }
}

void main() {
  var emailService = EmailService();
  var smsService = SMSService();

  var messagingSystem = MessagingSystem(emailService);
  messagingSystem.sendMessage('recipient@example.com', 'Hello, via email!');

  messagingSystem = MessagingSystem(smsService);
  messagingSystem.sendMessage('555-123-4567', 'Hello, via SMS!');
}

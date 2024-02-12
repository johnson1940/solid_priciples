/// This the example that follows the SRP and the correct structure of SRP
/// So each class is responsible for a single job or responsibility
/// The code is cleaner easy to understand
/// Modifications to one type of email logic won't impact the other.
/// Each class can be tested independently.


class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);
}

class UserRepository {
  void save(User user) {
    // Save user data to database
  }
}

class EmailService {
  void sendWelcomeEmail(User user) {
    // Send welcome email to the user
  }
}

class ChangePassWordService {
  void sendPasswordChangeEmail(User user) {
    // Send password change email to the user
  }
}
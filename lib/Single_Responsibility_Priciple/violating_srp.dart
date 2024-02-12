/// The example of violating the SRP we are handling the multiple jobs or responsibility in one class.
/// Changes to one responsibility (e.g., email sending logic) might impact other unrelated parts (e.g., password change).
/// InCase we are handling more responsibility the code become unreadable and maintainable
/// If issue occurs we tend to modify the class.

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);

  void save() {
    // Save user data to database
  }

  void sendWelcomeEmail() {
    // Send welcome email to the user
  }

  void changePassword(String newPassword) {
    // Change user's password and update database
  }
}


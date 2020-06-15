bool emailValidator(String email) {
  if (email.contains('@') && email.contains('.com')) {
    return true;
  } else {
    return false;
  }
}

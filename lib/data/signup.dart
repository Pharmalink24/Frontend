enum InputType {
  text,
  email,
  password,
  other,
}

const Map<String, InputType> signupInputs = {
  "First Name": InputType.text,
  "Last Name": InputType.text,
  "Username": InputType.text,
  "Email": InputType.email,
  "Specialty": InputType.text,
  "University": InputType.text,
  "Degree": InputType.other,
  "Password": InputType.text,
  "Confirm Password": InputType.text,
};

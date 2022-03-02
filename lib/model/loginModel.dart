class LoginModel{
  final String username;
  final String token;
  final String email;
  final int userId;

  LoginModel(this.username, this.token, this.email, this.userId);

  LoginModel.fromJson(Map<String, dynamic> json)
  : 
  username = json['username'],
  token = json['token'],
  email = json['email'],
  userId = json['pk'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'token': token,
    'email': email,
    'pk': userId,
  };

}
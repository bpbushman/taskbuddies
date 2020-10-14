class User {
  final String uid;
  final String username;
  final String email;

  User({
    this.email,
    this.uid,
    this.username,
  });

  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        email = data['email'],
        username = data['username'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
      };
}

class UserModel {
  final String username;
  final String password;
  final String lastname;
  final String imageUrl;
  final String email;
  final String phoneNumber;
  final String userId;
  final String authId;
  final String fcm;

  UserModel({
    required this.authId,
    required this.username,
    required this.password,
    required this.imageUrl,
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.lastname,
    required this.fcm
  });

  UserModel copyWith({
    String? username,
    String? lastname,
    String? password,
    String? email,
    String? phoneNumber,
    String? imageUrl,
    String? userId,
    String? authId,
    String? fcm,
  }) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      authId: authId ?? this.authId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lastname: lastname ?? this.lastname,
      fcm: fcm ?? this.fcm,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String? ?? "",
      password: json['password'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      email: json['email'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      lastname: json['lastname'] as String? ?? "",
      fcm: json['fcm'] as String? ?? "",
      authId: json['authId'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'lastname': lastname,
      'email': email,
      "phoneNumber": phoneNumber,
      "password": password,
      "userId":userId,
      "imageUrl": imageUrl,
      "fcm":fcm,
      "authId":authId,
    };
  }
  Map<String, dynamic> toJsonForUpdate() {
    return {
      "userId":userId,
      'username': username,
      'lastname': lastname,
      'email': email,
      "phoneNumber": phoneNumber,
      "password": password,
      "imageUrl": imageUrl,
      "fcm":fcm,
      "authId":authId,
    };
  }

  static UserModel initial() => UserModel(
        username: '',
        password: '',
        imageUrl: '',
        userId: '',
        email: '',
        phoneNumber: '',
        lastname: '',
      fcm:"",
      authId:""
      );
}

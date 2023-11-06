
class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    
  });

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstName': firstName,
      'lastName' : lastName,
      'email': email,
      
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      firstName: map['firstName'] as String,
      lastName:  map['lastName'] as String,
      email: map['email'] as String,
      
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, firstName: $firstName, lastName : $lastName , email: $email)';
  }




}

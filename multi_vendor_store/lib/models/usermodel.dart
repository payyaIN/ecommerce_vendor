import 'package:multi_ventor_store/utils/constants/imports.dart';

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String password;
  final String locality;
  final String token;
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.password,
    required this.locality,
    required this.token,
  });
//User constructor --acts as a blueprint for creating new users:

  //serialize - convert user object to map
// toMap() method is like packing a suitcase
// - it takes all user's information and puts it into a Map(suitcase)
// that's easier to send to a database or API:
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "state": state,
      "city": city,
      "password": password,
      "locality": locality,
      "token": token
    };
  }

//serialize - convert map to JSON string
//json.encode() --> convert dart object(Map,List) to JSON string representation

//toJson() method takes this Map(packed suitcase)
//and converts it into a string that can be sent over the internet:
  String toJson() => json.encode(toMap());

//deserialize --> convert map to User object -- done using factory constructor
//if any field is empty -- it takes as an empty string
//fromMap constructor --> takes Map<String,dynamic> - converts to - User object

// User.fromMap() factory constructor does opposite - unpacking a suitcase.
// When you get user data from a database or API, it comes as a Map,
// and this converts it back into a User object:

// as String ?? "" --> "if value == null, use an empty string instead"
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
      token: map['token'] as String? ?? "",
    );
  }

  //fromJson constructor --> takes JSON String -decodes to -- Map<String,dynamic>,
  //then use fromMap constructor to - convert Map to User object

//User.fromJson() takes a JSON string (like what we get from an API)
//- and converts it back into a User object by
//first converting it to a Map and then using fromMap()
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

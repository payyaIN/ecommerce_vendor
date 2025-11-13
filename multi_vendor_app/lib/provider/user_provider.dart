import 'package:multi_vendor_app/utils/constants/imports.dart';

class UserProvider extends StateNotifier<UserModel?> {
  // contructor initializing with default User Object
  //purpose: Mangae the state of the user  object allowing updates
  UserProvider()
    : super(
        UserModel(
          id: '',
          fullName: '',
          email: '',
          state: '',
          city: '',
          locality: '',
          password: '',
          token: '',
        ),
      );

  //Getter method to extract value from an object

  UserModel? get user => state;

  //method to set user state from Json
  //purpose : updates he user sate base on json String respresentation of user Object

  void setUser(String userJson) {
    state = UserModel.fromJson(userJson);
  }

  //Method to clear user state
  void signOut() {
    state = null;
  }

  //Method to Recreate the user state
  void recreateUserState({
    required String state,
    required String city,
    required String locality,
  }) {
    if (this.state != null) {
      this.state = UserModel(
        id: this.state!.id, //Preserve the existing user id
        fullName: this.state!.fullName, // preserve the existing user fullname
        email: this.state!.email, // preserve the existing user email
        state: state,
        city: city,
        locality: locality,
        password: this.state!.password, // preserve the existing user password
        token: this.state!.token, // preserve the existing user token
      );
    }
  }
}

//make the data accisible within the application
final userProvider = StateNotifierProvider<UserProvider, UserModel?>(
  (ref) => UserProvider(),
);

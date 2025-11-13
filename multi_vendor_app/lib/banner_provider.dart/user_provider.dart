import 'package:flutter_riverpod/legacy.dart';
import 'package:multi_vendor_app/models/usermodel.dart';

class UserProvider extends StateNotifier<UserModel?> {
  //initialize constructor with user default objects
  //purpose - managing the state of user objects
  UserProvider()
    : super(
        UserModel(
          id: '',
          fullName: '',
          email: '',
          state: '',
          city: '',
          password: '',
          locality: '',
          token: '',
        ),
      );

  //Getter method - to extract value from user object
  UserModel? get user => state;

  //Setter method - to set the user state from json
  //purpose - update the user state based on - json string representation of user object
  void setUser(String userJson) {
    state = UserModel.fromJson(userJson);
  }

  void signOut() {
    state = null;
  }

  //method to recreate the user state
  void recreateUserState({
    required String state,
    required String city,
    required String locality,
  }) {
    if (this.state != null) {
      this.state = UserModel(
        id: this.state!.id, //preserve the exisiting user id
        fullName: this.state!.fullName, //preserve the exisiting fullName
        email: this.state!.email, //preserve the exisiting email
        state: state,
        city: city,
        password: this.state!.password, //preserve the exisiting password
        locality: locality,
        token: this.state!.token, //preserve the exisiting token
      );
    }
  }
}
//Making the data accessible throughout the app

final userProvider = StateNotifierProvider<UserProvider, UserModel?>(
  (ref) => UserProvider(),
);

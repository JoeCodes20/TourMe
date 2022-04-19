import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class StoreUserSignup {
  static storeUserData(username, email, password) {
    DateTime date = DateTime.now();
    final creationDate = "${date.month}-${date.day}-${date.year}";
    // get userID and database ref and firestore collection
    final database = FirebaseDatabase.instance.ref();
    final usernameCollection =
        FirebaseFirestore.instance.collection("usernames");
    final currentUser = FirebaseAuth.instance.currentUser;
    final userID = currentUser!.uid;
    //get username doc and get database parentnode
    final usernameData = usernameCollection.doc(username);
    final mainUserRef = database.child("/users");

    mainUserRef.update({
      userID: {
        "username": username, //will always be lowercase
        "password": password,
        "email": email,
        "creationDate": creationDate,
        "isPremium": false,
        "userProtrait": null,
        "userBio": null,
        "likes": null,
        "profile": null,
        "social": null
      }
    });
    //create need doc based on username, use set only when creating new doc use update to update.
    usernameData.set({
      "uid": userID,
      "profile": "profile",
      "username": username,
      "banner": "banner",
      "name": username
    });

    // final usernameRef = database.child("usernames");
    // usernameRef.update({
    //   username: {
    //     "uid": userID,
    //     "profile": null,
    //     "username": username,
    //     "banner": null,
    //     "name": username
    //   }
    // });
  }

  static submitUserInfo(String name, String artForm, String userBio) {
    final database = FirebaseDatabase.instance.ref();
    final usernameCollection =
        FirebaseFirestore.instance.collection("usernames");
    final currentUser = FirebaseAuth.instance.currentUser;
    final userID = currentUser!.uid;
    final userRef = database.child("/users").child(
        userID); //always ref the child of what you what to update as a variable and not in the update method
    final usernameRef = database.child("/usernames");
    Random random = Random();
    final bannerNumber = random.nextInt(5);
    //get username from users
    userRef.child("username").once().then((event) {
      final snapshot = event.snapshot;
      final usernameSnapshot = snapshot.value;
      //target which username to update
      final username = usernameCollection.doc(usernameSnapshot
          .toString()); //always ref the child of what you what to update as a variable and not in the update method
      //update targeted username with name and banner number theme
      username.update({"name": name, "banner": bannerNumber});
    });
    //update targeted user with name artform and desc
    userRef.update({"name": name, "artForm": artForm, "userBio": userBio});
  }
}

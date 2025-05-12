import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';


class FireStoreHandler{
  static CollectionReference<User>getUserCollection(){
    var collectionReference=FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String,dynamic>?data = snapshot.data();
        return User.fromFireStore(data);
      },
      toFirestore: (user, options) {
        return user.toFireStore();
      },);
    return collectionReference;
  }
  static Future<void> AddUser( User user) {
    var collection = getUserCollection();
    var document = collection.doc(user.id);
    return document.set(user);
  }
  static Future<void> updateUserAddress(String userId, String project) {
    var collection = getUserCollection();
    var document = collection.doc(userId);
    return document.update({'project': project});
  }
  static Future<User?> getUser(String userId) async {
    try {
      var collection = getUserCollection();
      var document = collection.doc(userId);
      var snapshot = await document.get();

      // Check if the document exists
      if (snapshot.exists) {
        return snapshot.data();
      } else {
        print("User with ID $userId does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }
}
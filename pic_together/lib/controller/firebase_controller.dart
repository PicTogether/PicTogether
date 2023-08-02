import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_together/model/photo.dart';
import 'package:pic_together/model/user.dart';

class FirebaseController {
  // send user data to firebase
  Future<bool> sendUserData(User user) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // convert User object to Map type
      Map<String, dynamic> userData = {
        'userId': user.userId,
        'name': user.name,
        'phoneNum': user.phoneNum,
        'friends': user.friends,
      };

      // add data to 'users' collection
      await firestore.collection('users').doc(user.userId).set(userData);

      return true;
    } catch (e) {
      print('Failed to send data: $e');
      return false;
    }
  }

  // send photo data to firebase
  Future<bool> sendPhotoData(Photo photo) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // convert Photo object to Map type
      Map<String, dynamic> photoData = {};

      // add data to 'photos' collection
      await firestore.collection('photos').doc(photo.id).set(photoData);

      return true;
    } catch (e) {
      print('Failed to send data: $e');
      return false;
    }
  }

  //파이어베이스 공식문서를 또 보면서
// 1. 유저 id를 받아서 그 유저 객체를 반환하기. => 반환타입 Future<User>
// 2. 유저 id를 받았을 때 그 유저가 어떤 약속들을 가지고 있는지
// 3.
}

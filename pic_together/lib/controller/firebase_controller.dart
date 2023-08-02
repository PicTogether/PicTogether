import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pic_together/model/photo.dart';
import 'package:pic_together/model/user.dart';

import '../model/appointment.dart';
import '../model/friend_request.dart';
import '../model/gallery.dart';

class FirebaseController {
  // send user data to firebase
  Future<bool> sendUserData(User user) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // convert User object to Map type
      Map<String, dynamic> userData = {
        'id': user.id,
        'name': user.name,
        'phoneNum': user.phoneNum,
        'friends': user.friends,
        'appointmentId': user.appointmentId,
      };

      // add data to 'users' collection
      await firestore.collection('users').doc(user.id).set(userData);

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
      Map<String, dynamic> photoData = {
        'id': photo.id,
        'uploaderId': photo.uploaderId,
        'uploadTime': photo.uploadTime,
      };

      // add data to 'photos' collection
      await firestore.collection('photos').doc(photo.id).set(photoData);

      return true;
    } catch (e) {
      print('Failed to send data: $e');
      return false;
    }
  }

  // send gallery data to firebase
  Future<bool> sendGalleryData(Gallery gallery) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // convert Gallery object to Map type
      Map<String, dynamic> galleryData = {
        'id': gallery.id,
        'appointmentId': gallery.appointmentId,
        'photoIds': gallery.photoIds,
      };

      // add data to 'galleries' collection
      await firestore.collection('galleries').doc(gallery.id).set(galleryData);

      return true;
    } catch (e) {
      print('Failed to send data: $e');
      return false;
    }
  }

  // send friend request data to firebase
  Future<bool> sendFriendRequestData(FriendRequest friendRequest) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // convert FriendRequest object to Map type
      Map<String, dynamic> friendRequestData = {
        'id': friendRequest.id,
        'requesterId': friendRequest.requesterId,
        'responderId': friendRequest.responderId,
        'ok': friendRequest.ok,
      };

      // add data to 'friendRequests' collection
      await firestore
          .collection('friendRequests')
          .doc(friendRequest.id)
          .set(friendRequestData);

      return true;
    } catch (e) {
      print('Failed to send data: $e');
      return false;
    }
  }

  // send appointment data to firebase
  Future<bool> sendAppointmentData(Appointment appointment) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // convert Appointment object to Map type
      Map<String, dynamic> appointmentData = {
        'id': appointment.id,
        'title': appointment.title,
        'date': appointment.date,
        'people': appointment.people,
        'galleryId': appointment.galleryId,
      };

      // add data to 'appointments' collection
      await firestore
          .collection('appointments')
          .doc(appointment.id)
          .set(appointmentData);

      return true;
    } catch (e) {
      print('Failed to send data: $e');
      return false;
    }
  }

  // get user data from firebase
  Future<User> getUserData(String id) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // get data from 'users' collection
      DocumentSnapshot snapshot =
          await firestore.collection('users').doc(id).get();

      // convert Map type data to User object
      User user = User(
        (snapshot.data() as Map<String, dynamic>)['id'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['name'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['phoneNum'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['friends'] ?? [],
        (snapshot.data() as Map<String, dynamic>)['appointmentId'] ?? '',
      );

      return user;
    } catch (e) {
      print('Failed to get data: $e');
      return User('', '', '', [], '');
    }
  }

  //파이어베이스 공식문서를 또 보면서
// 1. 유저 id를 받아서 그 유저 객체를 반환하기. => 반환타입 Future<User>
// 2. 유저 id를 받았을 때 그 유저가 어떤 약속들을 가지고 있는지
// 3.
}

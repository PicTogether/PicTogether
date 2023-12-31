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
      return User('', '', '', [], '');
    }
  }

  // get photo data from firebase
  Future<Photo> getPhotoData(String id) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // get data from 'photos' collection
      DocumentSnapshot snapshot =
          await firestore.collection('photos').doc(id).get();

      // convert Map type data to Photo object
      Photo photo = Photo(
        (snapshot.data() as Map<String, dynamic>)['id'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['uploaderId'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['uploadTime'] ?? '',
      );

      return photo;
    } catch (e) {
      return Photo('', '', DateTime.now());
    }
  }

  // get gallery data from firebase
  Future<Gallery> getGalleryData(String id) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // get data from 'galleries' collection
      DocumentSnapshot snapshot =
          await firestore.collection('galleries').doc(id).get();

      // convert Map type data to Gallery object
      Gallery gallery = Gallery(
        (snapshot.data() as Map<String, dynamic>)['id'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['appointmentId'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['photoIds'] ?? [],
      );

      return gallery;
    } catch (e) {
      return Gallery('', '', []);
    }
  }

  // get friend request data from firebase
  Future<FriendRequest> getFriendRequestData(String id) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // get data from 'friendRequests' collection
      DocumentSnapshot snapshot =
          await firestore.collection('friendRequests').doc(id).get();

      // convert Map type data to FriendRequest object
      FriendRequest friendRequest = FriendRequest(
        (snapshot.data() as Map<String, dynamic>)['id'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['requesterId'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['responderId'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['ok'] ?? false,
      );

      return friendRequest;
    } catch (e) {
      return FriendRequest('', '', '', false);
    }
  }

  // get appointment data from firebase
  Future<Appointment> getAppointmentData(String id) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // get data from 'appointments' collection
      DocumentSnapshot snapshot =
          await firestore.collection('appointments').doc(id).get();

      // convert Map type data to Appointment object
      Appointment appointment = Appointment(
        (snapshot.data() as Map<String, dynamic>)['id'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['title'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['date'] ?? '',
        (snapshot.data() as Map<String, dynamic>)['people'] ?? [],
        (snapshot.data() as Map<String, dynamic>)['galleryId'] ?? '',
      );

      return appointment;
    } catch (e) {
      return Appointment('', '', '' as DateTime, [], '');
    }
  }

  // get user appointment data with user id
  Future<List<Appointment>> getUserAppointmentData(String id) async {
    try {
      // connect to Firebase Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // get data from 'appointments' collection
      QuerySnapshot snapshot = await firestore
          .collection('appointments')
          .where('people', arrayContains: id)
          .get();

      // convert Map type data to Appointment object
      List<Appointment> appointments = [];
      snapshot.docs.forEach((doc) {
        appointments.add(Appointment(
          (doc.data() as Map<String, dynamic>)['id'] ?? '',
          (doc.data() as Map<String, dynamic>)['title'] ?? '',
          (doc.data() as Map<String, dynamic>)['date'] ?? '',
          (doc.data() as Map<String, dynamic>)['people'] ?? [],
          (doc.data() as Map<String, dynamic>)['galleryId'] ?? '',
        ));
      });

      return appointments;
    } catch (e) {
      return [];
    }
  }
}

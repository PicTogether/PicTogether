import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pic_together/view/add_friend_view/add_friend_view.dart';
import 'package:pic_together/view/gallery_view/gallery_view.dart';
import 'package:pic_together/view/main_view/main_view.dart';

class AddFriendView extends StatefulWidget {
  const AddFriendView({Key? key}) : super(key: key);

  @override
  _AddFriendViewState createState() => _AddFriendViewState();
}

class _AddFriendViewState extends State<AddFriendView> {
  Future<void> _openImagePicker() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('친구 추가'),
        ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openImagePicker,
          child: Text('Invite Friends'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>GalleryView(),
              ),
            );
          },
          child: Icon(Icons.photo_library,),
            backgroundColor: Color(0xff655DBB),
            tooltip: '사진첩',
        ),
          SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () {
            // 홈 화면으로 이동하는 작업 수행
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>MainView(),
              ),
            );
          },
          child: Icon(Icons.home,),
            backgroundColor: Color(0xff655DBB),
            tooltip: '홈 화면',
        ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // 친구 추가 화면으로 이동하는 작업 수행
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>AddFriendView(),
                ),
              );
            },
            child: Icon(Icons.person_add,),
              backgroundColor: Color(0xff655DBB),
              tooltip: '친구 추가',
          ),
        ],
      ),
    );
  }
}
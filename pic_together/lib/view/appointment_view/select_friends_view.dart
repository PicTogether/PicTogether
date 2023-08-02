import 'package:flutter/material.dart';

class SelectFriendsView extends StatefulWidget{
  final List<String> availableFriends;
  final List<String> initialSelectedFriends;
  SelectFriendsView({required this.availableFriends, required this.initialSelectedFriends});

  @override
  _SelectFriendsView createState() => _SelectFriendsView();
}

class _SelectFriendsView extends State<SelectFriendsView>{
  List<String> selectedFriends = [];

  @override
  void initState(){
    super.initState();
    selectedFriends = widget.initialSelectedFriends;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: ChoiceChip(
        label: Text(f),
      ),
    )
  }
}
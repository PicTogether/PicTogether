import 'package:flutter/material.dart';
import 'dart:io';

class GalleryView extends StatefulWidget{
  const GalleryView({Key? key}) : super(key: key);

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView>{
  Future<void> _openImagePicker() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openImagePicker,
          child: Text('Open Gallery'),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  var filepath;

  List<File?> imageList = [];
  // int? length=0;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
      var response=GallerySaver.saveImage(_image!.path);
      imageList.add(_image);
      // length= imageList.length;
      print(imageList.length);
      print("this is image list");
      print(_image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body:SafeArea(
        
        child:   
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: IconButton(icon: Icon(Icons.camera, size: 52), onPressed: getImage,),
                  ),
                ],
              ),
              _image == null ? 
              Container(
                child: Container(
                  
                  child: Text("Please Take an Image")),
              ) :
          
           Container(
             alignment: Alignment.topCenter,
             width: 250, height: 300,
            //  color: Colors.red,
            
             child: 
             
             Image.file(_image!)),
            ],
          )
          
         
             
             
             ),
        

      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage,
      //   // tooltip: "Increment",
      //   child: Icon(Icons.camera),
      // ),
      
    );
  }
}

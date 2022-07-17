import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/models/item_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  final AudioPlayer audioPlayer = AudioPlayer();
  int ? _playingindex ;

  List<Item> items = [
    Item(name: "Forest Sounds", imagePath: "meditation_images/forest.jpeg",
        audioPath: "meditation_audios/forest.mp3"),
    Item(name: "Ocean Breeze", imagePath: "meditation_images/ocean.jpeg",
        audioPath: "meditation_audios/ocean.mp3"),
    Item(name: "Night Sounds", imagePath: "meditation_images/night.jpeg",
        audioPath: "meditation_audios/night.mp3"),
    Item(name: "Windy Evening", imagePath: "meditation_images/wind.jpeg",
        audioPath: "meditation_audios/wind.mp3"),
    Item(name: "Water Fall", imagePath: "meditation_images/waterfall.jpeg",
        audioPath: "meditation_audios/waterfall.mp3"),
  ];

 /* Widget getIcon (int index) {
    if(index == _playingindex){
      return  const Icon(Icons.stop);
    }
  else {
      return const Icon(Icons.play_arrow);
    }
  } */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child : ListView.builder(
         itemCount: 5,
         itemBuilder: (BuildContext context, int index) {
           return Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(
               height: 100,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),

                   image:  DecorationImage(
                     fit:  BoxFit.cover,
                     image : AssetImage(items[index].imagePath),
                   )
                 ),
               child: ListTile(
                   leading:BorderedText(
                     strokeWidth: 4,
                       strokeColor: Colors.black,
                       child : Text(items[index].name,
                         style:
                         GoogleFonts.lato(fontSize: 34,
                             fontWeight: FontWeight.bold),),),
                 trailing: IconButton(
                     icon : _playingindex == index ? const FaIcon(Icons.stop_circle_outlined, size: 34,)
                         : const FaIcon(Icons.play_circle_outline, size: 34),
                 onPressed: (){

                       setState(() {
                         if(_playingindex == index){
                           setState(() {
                             _playingindex == null;
                           });
                           audioPlayer.stop();
                         }else
                           {
                             audioPlayer.setAsset(items[index].audioPath);
                             audioPlayer.play();

                           }
                         setState(() {
                           _playingindex =index;
                         });



                       });

               },),

               ),
             ),
           );
         },




       ),

     ),
    );
  }
}

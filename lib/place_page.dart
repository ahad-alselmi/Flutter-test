import 'package:flutter/material.dart';
import 'package:second_app/place_detailes.dart';
import 'place_detailes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';


class PlacePage extends StatelessWidget {
  double screenWidth;
 PlaceDetailes detailes;
  PlacePage(PlaceDetailes detailes){
    this.detailes=detailes;
  }
  // or short like this PlacePage(this. detailes);
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;//to adjust  image with screen
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          //Padding(padding:EdgeInsets.all(28.0)),
         Flexible(child:_buildPlaceImage(),flex:1) ,
          Flexible(child:Column(children:[_buildPlaceTitleAndRating(),
            _buildUserAction(),
            _placeDescription(),
          ]),
          flex:2),

        ]
    );
  }






    _buildPlaceImage(){
    //how to fit image

      return Container(
        width: screenWidth,
        child:FittedBox(fit:BoxFit.fitWidth,
          child:Image(
          image: AssetImage(detailes.imageUrl),
        ),

        ),);
    }
    _buildPlaceTitleAndRating(){
     return  Container(

        //color:Colors.grey,
        child:Padding(padding:   const EdgeInsets.all(28.0),
          child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Expanded(

                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        Text(detailes.name,style:TextStyle(fontSize: 25)),

                        Text(detailes.city,style:TextStyle(fontSize: 16))

                      ]

                  ),),

                Icon(Icons.star,color:Colors.red,),
                Text(detailes.stars.toString(),style:TextStyle(fontSize: 20)),
              ]
          ),),);
    }

    _buildShareButton(){
    Widget share=_buildSettingElement(Icons.share, "share");
    return InkWell(
      child:share,
        onTap:(){
          // _share();
          Share.share(detailes.webUrl);

        }
    );
  }
    _buildLocationButton(){
    Widget location=_buildSettingElement(Icons.location_on, "Location");
    return InkWell(
      child:location,
        onTap:(){
         // _goToMaps();
        }
    );
  }
    _buildCallButton(){
    Widget call=_buildSettingElement(Icons.call, "call");
    return InkWell(
      child:call,
        onTap:(){
          _call();
        }
    );
  }
    _buildUserAction(){
      Widget share=_buildShareButton();
      Widget location=_buildLocationButton();
      Widget call=_buildCallButton();
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          share,
          location,
          call,

        ],
      );
    }
    _buildSettingElement(IconData icon,String text){
  return Column(
    children: <Widget>[
      Icon(icon,color:Colors.lightBlue,size:30),
      Text(text.toUpperCase())
    ],
  );
}

    _placeDescription(){
       return Padding(padding:EdgeInsets.all(28.0),
        child: Text(detailes.description),
        );
    }

    _call() async{
    String phone=detailes.phoneNumber;
    if(await canLaunch(phone)){
      (await launch(phone));}
          else{
            throw 'could not launch $phone';}
    }
  /* _share() async{
    String webUrl=detailes.webUrl;//data from another screen
    if(await canLaunch(webUrl)){(await launch(webUrl));}
    else {throw 'could not launch $webUrl';}


    }*/
  /* _goToMaps() async {
  String mapLocationUrl =
      "https://www.google.com/maps/search/?api=1&query=$detailes.longitude,$detailes.latitude";
  //final String encodedUrl=Uri.encodeFull(mapLocationUrl);
  if(await canLaunch(mapLocationUrl)){ await launch(mapLocationUrl);}
  else{
    print('Can not launch $mapLocationUrl');
    throw ('Can not launch the location $mapLocationUrl');}
}*/
}//class

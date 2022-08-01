class PlaceDetailes{
  String imageUrl;
  String  name;
  String city;
  String phoneNumber;
 double longitude;
  double latitude;
  String description;
  double stars;
  String webUrl;

   PlaceDetailes fillData(){
  PlaceDetailes detailes= PlaceDetailes();

 detailes. imageUrl='images/nature.jpg';
  detailes.name="Suqatra Island";
  detailes. city="YEMEN";
 detailes.phoneNumber="tel:+966 505231809";
  detailes.longitude=46.675297;
  detailes.latitude=24.713552;
  detailes.description="qwwerttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
      "jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj";
  detailes.stars=41.0;

  detailes.webUrl ='https://web.whatsapp.com/';

  return detailes;
   }
}
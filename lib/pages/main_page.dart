import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_home_work/modal/day_time_weather.dart';
import 'package:weather_home_work/modal/model_class.dart';
import 'package:weather_home_work/service/day_time_netservice.dart';
import 'package:weather_home_work/service/internet_service.dart';



class MainPage extends StatefulWidget {
  MainPage({required this.city}) ;
  String city;

  @override
  State<MainPage> createState() => _MainPageState(city);
}

class _MainPageState extends State<MainPage> {
  String _city;

  _MainPageState(this._city);
  //bu joy nomi kiritiladigan dialogdai tekst olish uchun
  TextEditingController textEditingController=TextEditingController();
  NetServiced netServiced =NetServiced();
  //netServicedan kelgan CurrentWeatherData turli malumotni
  //ozini turiga mos clasdan olingan abjectga tenglaymiz
  CurrentWeatherData currentWeatherData=CurrentWeatherData();
  DayTimeNetService dayTimeNetService=DayTimeNetService();
  DayTimeWeather dayTimeWeather=DayTimeWeather();
  List<Forecastday> list=[];
 static const List<String> shaxarlar=["Moscow","Samarkand","Istanbul","Delhi","Bukhara",];
  List<DayTimeWeather> oxiri=[];

  @override
  void initState() {
    malumotOlishUchun();
    dayTimeMalumotlari();
    super.initState();
  }
  void malumotOlishUchun()async{
    netServiced.getCurrWeath(_city??"Tashkent").then((value) {
      // bu yerda value netServiceni return qiymatini oladi
      setState(() {
        currentWeatherData=value;
      });


    });
  }

  void dayTimeMalumotlari()async{
    dayTimeNetService.soatbayWeather(_city??"Tashkent").then((value){
      setState(() {
        dayTimeWeather=value;
        list=dayTimeWeather.forecast!.forecastday!;

        for(int i=0;i<shaxarlar.length; i++){
          dayTimeNetService.soatbayWeather(shaxarlar[i]).then((value){
            oxiri.add(value);
          });
        }
      });

    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        Container(

          child: Image.asset("assets/orqa.png",width:400,fit:BoxFit.fill ,),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x901518F5), Color(0x8E8716FF)]
            )
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(// tepadan birinchi
              padding: EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    setState(() {

                    });
                  }, icon:Icon(Icons.account_tree_sharp),color: Colors.white,iconSize: 30,),
                  Text("${currentWeatherData.location?.region}",style: TextStyle(color: Colors.white,fontSize: 18),),
                  IconButton(onPressed: (){
                    setState(() {

                    });
                  }, icon:Icon(Icons.cached),color: Colors.white,iconSize: 30,)

                ],
              ),
            ), // tepadan birinchi
            Container(// ikkinchi
              height: 240,
              child: Column(
                children: [
                  Text("${dayTimeWeather.current?.condition?.text}",style: TextStyle(color: Colors.white,fontSize: 14)),
                  Image.network("http:${currentWeatherData.current?.condition?.icon}",width:90,fit: BoxFit.fill,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${currentWeatherData.current?.tempC?.toInt()}",style: TextStyle(color: Colors.white,fontSize:70,fontWeight: FontWeight.bold)),
                      Image.asset("assets/circle.png",width: 30,)],),
                  Text("${currentWeatherData.location?.localtime}",style: TextStyle(color: Colors.white,fontSize: 18),)
                ],
              ),
            ), // ikkinchi
            Container(// uchinchi
              padding: EdgeInsets.only(left: 10,right: 10),
              width: 250,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x905D5ED9), Color(0x8E9444EA)]
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/icons/insurance 1.png",width: 40,),
                      Text("${currentWeatherData.current?.cloud} %",style: TextStyle(color: Colors.white,fontSize: 13)),
                      Text("Precipition",style: TextStyle(color: Colors.white,fontSize: 13)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/icons/insurance 1 (1).png",width: 40,),
                      Text("${currentWeatherData.current?.humidity}",style: TextStyle(color: Colors.white,fontSize: 13)),
                      Text("Humidity",style: TextStyle(color: Colors.white,fontSize: 13)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/icons/vind.png",width: 40,),
                      Text("${currentWeatherData.current?.windKph} km/h",style: TextStyle(color: Colors.white,fontSize: 13)),
                      Text("Wind Speed",style: TextStyle(color: Colors.white,fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ), // uchinchi
            Container(// turtinchi
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today",style: TextStyle(color: Colors.white,fontSize: 13)),
                  Text("7 Days",style: TextStyle(color: Colors.white,fontSize: 13)),
                ],
              ),
            ), // turtinchi
            Container(// beshinchi
            //  padding: EdgeInsets.only(left: 10,right: 10),
              height: 70,
              child:ListView.separated(
                scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return builtItem(index);
                },
                separatorBuilder: (context,index){
                return Divider(thickness: 20,color: Colors.red);
                }, itemCount: 7)

            ), // beshinchi
            Container(// oltinchi
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Other Cities", style: TextStyle(color: Colors.white,fontSize: 18)),
                  Icon(Icons.add,color: Colors.white,)
                ],
              ),
            ), // oltinchi
            Container(

              height: 70,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                  itemBuilder: (context,index){

                    return builtItemOxiri(index);
                  },
                  separatorBuilder:(context,index){
                    return Divider(thickness: 5, color: Colors.red,);
                  },
                  itemCount: 5),
            )  // oxirgi qator

          ],
        )
      ],),
      bottomNavigationBar:CurvedNavigationBar(
        height: 60,
        backgroundColor: Color(0x79640FBE),
        buttonBackgroundColor:Color(0xFF3E57D5),
        color: Color(0xFFB010EF),
        items: <Widget>[
          Icon(Icons.home,color: Colors.white),
          Icon(Icons.find_in_page_sharp,color: Colors.white),
          Icon(Icons.person,color: Colors.white),
          Icon(Icons.add_alert_rounded,color: Colors.white),
        ],
        onTap: (int index){

          setState(() {
            // 1 tartib raqamli icon bosilganda joy kiritilish kk Dialog orqali
            index==1?showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text("Enter city name:"),
              actions: [
                TextField(
                  controller: textEditingController,
                ),
                TextButton(onPressed: (){

                 setState(() {
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return MainPage(city: textEditingController.text,);
                   }));
                 });

                }, child: Text("Continiu"))
              ],
            )):null;
          });

        },
      )
    );
  }
  Widget builtItem(int index){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        width: 80,
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x905D5ED9), Color(0x8E9444EA)]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${list[index].hour?[12].time?.substring(11,16)} AM", style: TextStyle(color: Colors.white,fontSize: 11),),
            Text("${list[index].hour?[12].time?.substring(0,11)}", style: TextStyle(color: Colors.white,fontSize: 9),),
            Image.network("http:${list[index].hour?[12].condition?.icon}",width: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${list[index].hour?[12].tempC}",style: TextStyle(color: Colors.white,fontSize:13,fontWeight: FontWeight.bold)),
                Image.asset("assets/circle.png",width: 5,)],),
          ],
        ),
      ),
    );
  }
  Widget builtItemOxiri(int index1){


    return GestureDetector(
      onTap: (){
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>MainPage(city:"${oxiri[index1].location?.region}" ,)));
        });
      },
      child:  Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            width: 200,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x905D5ED9), Color(0x8E9444EA)]
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("http:${oxiri[index1].current?.condition?.icon}",width: 40,),
                Column(children: [
                  Text("${oxiri[index1].location?.region}",style: TextStyle(color: Colors.white,fontSize: 14)),
                  Text("${oxiri[index1].forecast?.forecastday?[0].day?.condition?.text}",style: TextStyle(color: Colors.white,fontSize: 13)),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${oxiri[index1].current?.tempC}",style: TextStyle(color: Colors.white,fontSize:14,fontWeight: FontWeight.bold)),
                    Image.asset("assets/circle.png",width: 5,)],),
              ],
            ),
          )
      ),
    );

  }
}

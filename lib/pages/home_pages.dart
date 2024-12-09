import 'package:flutter/material.dart';
import 'package:netflix_clone/json/home_json.dart';
import 'package:netflix_clone/pages/video_detail_page.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/banner.webp"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.85),
                              Colors.black.withOpacity(0),
                            ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/title_img.webp",
                              width: 300,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Exciting - Sci-Fi Drama - Sci-Fi Adventure",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My List",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (_) => VideoDetailPage(
                                       videoUrl: "assets/videos/video_1.mp4"
                                   )));
                        },
                        child : Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 13,left: 8,top: 2,bottom: 2),
                            child: Row(
                              children: [
                                    Icon(
                                        Icons.play_arrow,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                SizedBox(width: 5,),
                                Text("Play",style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.w600,),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.info_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Info",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Text("My List",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 8,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Center(
                            child: Row(
                              children: List.generate(mylist.length,(index){
                                return GestureDetector(
                                  onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>VideoDetailPage(
                                                  videoUrl: "assets/videos/video_1.mp4"))
                                        );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    width: 210,
                                    height: 300,
                                    decoration: BoxDecoration(
                                       image: DecorationImage(image: AssetImage(mylist[index]['img']),
                                           fit:BoxFit.cover,
                                       ),
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Text("Popular On Netflix",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 8,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: List.generate(popularList.length,(index){
                              return GestureDetector(
                                onTap: (){
                                   Navigator.push(
                                       context,
                                     MaterialPageRoute(
                                         builder: (_) =>VideoDetailPage(
                                             videoUrl: "assets/videos/video_2.mp4 "))
                                   );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(popularList[index]['img']),
                                        fit:BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Text("Trending Now",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 8,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: List.generate(trendingList.length,(index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (_) => VideoDetailPage(
                                  videoUrl: "assets/videos/video_2.mp4"
                                  )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(trendingList[index]['img']),
                                        fit:BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Text("Netflix Originals",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 8,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: List.generate(originalList.length,(index){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (_) => VideoDetailPage(
                                      videoUrl: "assets/videos/video_1.mp4"
                                      )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  width: 265,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(originalList[index]['img']),
                                        fit:BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Text("Anime",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 8,),
                       SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: List.generate(animeList.length,(index){
                              return GestureDetector(
                                onTap: (){
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (_) => VideoDetailPage(
                                      videoUrl: "assets/videos/video_1.mp4"
                                      )));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  width: 210,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(animeList[index]['img']),
                                        fit:BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            "assets/images/logo.ico",
                            width: 35,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.collections_bookmark,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/profile.jpeg",
                                width: 26,
                                height: 26,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Tv Shows",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Movies",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

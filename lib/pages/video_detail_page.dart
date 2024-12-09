import 'package:flutter/material.dart';
import 'package:netflix_clone/json/video_detail_json.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoUrl;
  const VideoDetailPage({super.key, required this.videoUrl});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late VideoPlayerController _controller;
  int activeMenu = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.collections_bookmark,
            size: 28,
            color: Colors.white,
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
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Container(
            height: 220,
            child: Stack(
              children: [
                AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    icon: Icon(
                      _controller.value.isPlaying ? null : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            "Preview",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 20,
                  child: Container(
                    width: 25,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.volume_mute,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height - 330,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age of Sumuria: Battle for Japan",
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 28,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "New",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "2024",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 6, right: 6, top: 4, bottom: 4),
                            child: Text(
                              "18+",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "1 season",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2), width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 6, right: 6, top: 4, bottom: 4),
                            child: Text(
                              "HD",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Watch Season 1 Now",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Resume",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Download",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "S1:E1 The Rise of Nobunage",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 30) * 0.75,
                          child: Stack(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.75,
                                height: 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: (size.width - 30) * 0.2,
                                height: 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "35 remaining",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Considered a fool and unfit to lead, Nobunaga rises to power as the head of the Oda clan, "
                      "spurring dissent among those in his family vying for control.",
                      style: TextStyle(
                        height: 1.4,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Cast: Masayoshi Heneda,Masami Kosaka,Hideaki Ito...more",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: List.generate(likesList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Column(
                            children: [
                              Icon(
                                likesList[index]['icon'],
                                color: Colors.white.withOpacity(0.9),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                likesList[index]['text'],
                                style: TextStyle(
                                  height: 1.4,
                                  color: Colors.grey.withOpacity(0.9),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(episodesList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeMenu = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: activeMenu == index
                                            ? Border(
                                                top: BorderSide(
                                                color: Colors.red,
                                                width: 4,
                                              ))
                                            : null),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        episodesList[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: activeMenu == index
                                                ? Colors.white.withOpacity(0.9)
                                                : Colors.white
                                                    .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Season 1",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(movieList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: (size.width - 30) * 0.85,
                                    height: 100,
                                    decoration:
                                        BoxDecoration(color: Colors.black),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: (size.width - 30) * 0.85,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 150,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 150,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          image: DecorationImage(
                                                              image:
                                                                  AssetImage(
                                                                      movieList[index]
                                                                      ['img']),
                                                            fit: BoxFit.cover
                                                          ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 150,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        color:
                                                        Colors.black
                                                            .withOpacity(0.3)
                                                      ),),
                                                    Positioned(
                                                      top: 30,
                                                      left: 57,
                                                      child: Container(
                                                        width: 38,
                                                        height: 38,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                            color: Colors.black
                                                                .withOpacity(0.4),
                                                            border:Border.all(
                                                              width: 2,
                                                              color: Colors.white,
                                                            ),
                                                        ),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.play_arrow,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          Container(
                                            width: (size.width ) * 0.35,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(movieList[index]['title'],
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    height: 1.3,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                  ),
                                                  ),
                                                  SizedBox(height: 3,),
                                                  Text(
                                                    movieList[index]['duration'],
                                                    style: TextStyle(
                                                     fontSize:14,
                                                      height: 1.3,
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: (size.width - 30) * 0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.file_download,
                                      color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 5,),
                              Text(movieList[index]['description'],
                                style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

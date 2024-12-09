import 'package:flutter/material.dart';

class DownloadPages extends StatefulWidget {
  const DownloadPages({super.key});

  @override
  State<DownloadPages> createState() => _DownloadPagesState();
}

class _DownloadPagesState extends State<DownloadPages> {
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
      title: Text(
        "My Downloads",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              color: Colors.white,
              Icons.collections_bookmark,
              size: 28,
            )),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Smart Downloads",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "ON",
                  style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 60,),
        Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.file_download,
                  size: 80,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text(
              "Never be without Netflix",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Text(
                "Download shows and movies so you'll never be "
                "without something to watch even when you are offliine.",
                textAlign:  TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              width: size.width * 0.95,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Text("See What You Can Download",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ],
        ),
        Spacer()
      ],
    );
  }
}

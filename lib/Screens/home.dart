import 'package:laundry_app/Constant/details.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: <Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 7 / 7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Color(0xff2550255)],
                ),
              ),
            ),
          ),
          Positioned(
            left: 35,
            top: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Choose Your Catergory",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    )),
              ],
            ),
          ),
          Positioned(
              left: 55,
              top: 50,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "Get your laundry washed, folded and \ndelivered straight to your door.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
            left: 20,
            top: 130,
            right: 20,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Detailes()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _customCard(
                          imageUrl: "washing-machine.png",
                          item: "Wash",
                          duration: "1 Day"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 300,
            right: 20,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Detailes()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _customCard(
                          imageUrl: "dry.png",
                          item: "Dry Clean",
                          duration: "3 Days")
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 470,
            right: 20,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Detailes()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _customCard(
                          imageUrl: "clean.png",
                          item: "Premium",
                          duration: "3 Days"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Positioned(
              left: 155,
              top: 675,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "Drip & Drop",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  _customCard({String imageUrl, String item, String duration}) {
    return SizedBox(
      height: 168,
      width: 150,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/home_images/" + imageUrl),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(duration)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var controlPoint = Offset(size.width - (size.width / 2), size.height - 120);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

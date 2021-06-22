import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body(){
    return Stack(
      children: [
        _greyContainer(),
        _orangeTriangle(),
        _mainUI()
      ]
    );
  }

  Widget _greyContainer(){
    return Container(
      color: Color.fromARGB(255, 48, 48, 48)
    );
  }

  Widget _orangeTriangle(){
    return ClipPath(
      clipper: TriangleShape(),
      child: Container(
        color: Colors.deepOrange,
      ),
    );
  }

  Widget _mainUI(){
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            _topLeftContainer(),
            Spacer(),
            _bottomRightContainer()
          ],
        )
      )
    );
  }

  Widget _topLeftContainer(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.face,
            size: 32,
            color: Colors.white,
          ),
          SizedBox(width: 10,),
          Text("Lorem",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )
        ],
      )
    );
  }

    Widget _bottomRightContainer(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Spacer(),
          Text("Ipsum",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          SizedBox(width: 10,),
          Icon(Icons.face,
            size: 32,
            color: Colors.black
          ),
        ],
      )
    );
  }
}

class TriangleShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
 }

  @override
    bool shouldReclip(CustomClipper oldClipper) {
    return true;
 }
}
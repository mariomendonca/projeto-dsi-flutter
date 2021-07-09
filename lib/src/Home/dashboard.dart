import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    List cardList = [Item1(), Item2(), Item3()];
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return Container(
        child: Column(
      children: [
        CarouselSlider(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 8),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: cardList.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Card(                  
                  color: Color.fromRGBO(0, 191, 186, 1),
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
      ],
    ));
  }
}

class Item1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image.asset("assets/images/ambulance.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Em casos de \nemergência...',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                Text('Não espere pela \na consulta.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),),
                Text('Ligue 192',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ))
              ],
            ),
          )
        ]
      )
    );
  }
}
class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset("assets/images/doctor.png"),
          ),
          Padding(padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cuide bem da \nsua saúde',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                ),
                Text('Marque sua consulta \ncom um especialista',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),)
              ],
            ),
          )

        ]
      )
    );
  }
}
class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset("assets/images/vacina.png"),
          ),
          Padding(padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Lute contra o vírus',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
                ),
                Text('Marque sua vacine e \ncontinue usando máscara',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),)
              ],
            ),
          )

        ]
      )
    );
  }
}

// import 'package:cmedapp/components/appbar_with_logo.dart';
// import 'package:cmedapp/components/button_padrao.dart';

// import 'package:cmedapp/src/ConsultaMarcada/marcar_consulta.dart';
// import 'package:cmedapp/src/MarcandoConsulta/schedulesBox.dart';

// import 'package:flutter/material.dart';

// class MarcandoConsultaPage extends StatefulWidget {
//   // const MarcandoConsultaPage({ Key? key }) : super(key: key);

//   @override
//   _MarcandoConsultaPageState createState() => _MarcandoConsultaPageState();
// }

// class _MarcandoConsultaPageState extends State<MarcandoConsultaPage> {
//   @override
//   int _horarioConsulta = 0;

//   void setAppointmentHour(hour) {
//     setState(() {
//       _horarioConsulta = hour;
//     });
//   }

//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.lightBlue[50],
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(size.height * 0.3),
//         child: MyAppBar(),
//       ),
//       body: Container(
//         height: size.height,
//         width: size.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(
//                 40,
//               ),
//               topRight: Radius.circular(40)),
//           color: Colors.white,
//         ),
//         child: ListView(children: <Widget>[
//           Column(
//             children: [
//               Container(
//                 width: size.width * 0.8,
//                 margin: EdgeInsets.only(top: 50),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Marcando consulta",
//                       style:
//                           TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 width: size.width * 0.8,
//                 margin: EdgeInsets.only(top: 20, bottom: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
//                       style: TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.normal),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 width: size.width * 0.8,
//                 margin: EdgeInsets.only(top: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Horários disponíveis",
//                       style:
//                           TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 30),
//             child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 8;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 8,
//                   from: "8",
//                   to: "9",
//                 ),
//               ),
//               SizedBox(width: size.width * 0.1),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 9;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 9,
//                   from: "9",
//                   to: "10",
//                 ),
//               ),
//               SizedBox(width: size.width * 0.1),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 10;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 10,
//                   from: "10",
//                   to: "11",
//                 ),
//               ),
//             ]),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 30),
//             child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 11;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 11,
//                   from: "11",
//                   to: "12",
//                 ),
//               ),
//               SizedBox(width: size.width * 0.1),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 13;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 13,
//                   from: "13",
//                   to: "14",
//                 ),
//               ),
//               SizedBox(width: size.width * 0.1),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 14;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 14,
//                   from: "14",
//                   to: "15",
//                 ),
//               ),
//             ]),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 30),
//             child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 15;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 15,
//                   from: "15",
//                   to: "16",
//                 ),
//               ),
//               SizedBox(width: size.width * 0.1),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 16;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 16,
//                   from: "16",
//                   to: "17",
//                 ),
//               ),
//               SizedBox(width: size.width * 0.1),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _horarioConsulta = 17;
//                   });
//                 },
//                 child: SchedulesBox(
//                   active: _horarioConsulta == 17,
//                   from: "17",
//                   to: "18",
//                 ),
//               ),
//             ]),
//           ),
//           Container(
//               width: size.width * 0.8,
//               margin: EdgeInsets.only(top: 50),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ButtonPadrao(
//                         text: "Marcar consulta",
//                         press: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => ConsultaMarcada(),
//                             ),
//                           );
//                         }),
//                   ])),
//         ]),
//       ),
//     );
//   }
// }

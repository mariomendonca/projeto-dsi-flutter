import 'package:cmedapp/components/AppBarWithLogo.dart';
import 'package:cmedapp/components/button_padrao.dart';
import 'package:cmedapp/screens/CadastroPac/cadastro_paciente.dart';
import 'package:cmedapp/screens/ConsultaMarcando/schedulesBox.dart';
import 'package:cmedapp/screens/MarcandoConsulta/marcar_consulta.dart';
import 'package:flutter/material.dart';

class MarcandoConsultaPage extends StatefulWidget {
  // const MarcandoConsultaPage({ Key? key }) : super(key: key);

  @override
  _MarcandoConsultaPageState createState() => _MarcandoConsultaPageState();
}

class _MarcandoConsultaPageState extends State<MarcandoConsultaPage> {
  @override
  int _appointmentHour = 0;

  void setAppointmentHour(hour) {
    setState(() {
      _appointmentHour = hour;
    });
  }

  Widget build(BuildContext context) {
    var number = 8;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.3),
        child: MyAppBar(),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                40,
              ),
              topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: ListView(children: <Widget>[
          Column(
            children: [
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Marcando consulta",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Horários disponíveis",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 8;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 8,
                  from: "8",
                  to: "9",
                ),
              ),
              SizedBox(width: size.width * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 10;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 10,
                  from: "10",
                  to: "11",
                ),
              ),
              SizedBox(width: size.width * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 14;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 14,
                  from: "14",
                  to: "15",
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 16;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 16,
                  from: "16",
                  to: "17",
                ),
              ),
              SizedBox(width: size.width * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 17;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 17,
                  from: "17",
                  to: "18",
                ),
              ),
              SizedBox(width: size.width * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 18;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 18,
                  from: "18",
                  to: "19",
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 19;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 19,
                  from: "19",
                  to: "20",
                ),
              ),
              SizedBox(width: size.width * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 20;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 20,
                  from: "20",
                  to: "21",
                ),
              ),
              SizedBox(width: size.width * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _appointmentHour = 21;
                  });
                },
                child: SchedulesBox(
                  active: _appointmentHour == 21,
                  from: "21",
                  to: "22",
                ),
              ),
            ]),
          ),
          Container(
              width: size.width * 0.8,
              margin: EdgeInsets.only(top: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonPadrao(
                        text: "Marcar consulta",
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MarcandoConsulta(),
                            ),
                          );
                        }),
                  ])),
        ]),
      ),
    );
  }
}

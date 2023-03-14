import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class Data {
//   String kode = "";
//   String nama = "";
//   String vol = "";
//   String turnOver = "";
//   String harga = "";
//   String naikTurun = "";
//   String pctNaikTurun = "";
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String kode = "";
  String nama = "";
  String vol = "";
  String turnOver = "pertama";
  String time = "day";
  String harga = "";
  String naikTurun = "";
  String pctNaikTurun = "";

  @override
  Widget build(BuildContext context) {
    // Dropdown pertama
    List<DropdownMenuItem<String>> drop1 = [];
    var ato = const DropdownMenuItem<String>(
      value: "pertama",
      child: Text("Active Turn Over"),
    );
    var av = const DropdownMenuItem<String>(
      value: "kedua",
      child: Text("Active Volume"),
    );
    drop1.add(ato);
    drop1.add(av);

    // Dropdown kedua
    List<DropdownMenuItem<String>> drop2 = [];
    var day = const DropdownMenuItem<String>(
      value: "day",
      child: Text("1D"),
    );
    var week = const DropdownMenuItem<String>(
      value: "week",
      child: Text("1W"),
    );
    drop2.add(day);
    drop2.add(week);

    // Body
    return MaterialApp(
      title: 'Kelompok 2',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Container(
          // padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // dropwdown
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(38, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all()),
                        padding: EdgeInsets.all(15),
                        child: DropdownButtonFormField(
                            value: turnOver,
                            items: drop1,
                            decoration: InputDecoration(
                                isCollapsed: true,
                                enabledBorder: InputBorder.none),
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != null) {
                                  turnOver = newValue;
                                }
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(38, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all()),
                        padding: EdgeInsets.only(left: 700),
                        child: DropdownButtonFormField(
                            value: time,
                            items: drop2,
                            onChanged: (String? newValue) {
                              setState(() {
                                if (newValue != null) {
                                  time = newValue;
                                }
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              // Card(
              //     child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     ListTile(
              //         trailing: const Icon(Icons.more_vert),
              //         title: const Text('BBRI'),
              //         subtitle: const Text("Volume\nTurn Over"),
              //         tileColor: Colors.white70),
              //     ListTile(
              //         trailing: const Icon(Icons.more_vert),
              //         title: const Text('Bank Rakyat Indonesia'),
              //         subtitle: const Text("125.2 M\n602.5 B"),
              //         tileColor: Colors.white70),
              //   ],
              // )),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 2'),
            content: const Text(
                'Audry Leonardo Loo (leonardoaudry@upi.edu) ; Villeneuve Andhira Suwandhi (v.andhira@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

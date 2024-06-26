import 'package:flutter/material.dart';
import 'package:oway/Register_Login/HereglegchBurtgel.dart';
import 'package:oway/Register_Login/VendorRegister/VendorReg.dart';
import 'package:oway/Register_Login/login.dart';

class Ouei extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Төрөл",
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/oway.png',
            height: 100,
            width: 100,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Төрлөө сонгоно уу",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Өөрт тохирох төрлөө сонгосноор зөвхөн танд зориулсан үйлчилгээг авах болно",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Burtgel()));
                      print("Захиалагч card tapped");
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.account_box,
                              size: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 150, height: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Захиалагч"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NiiluulegchRegister()));
                      print("Өрхийн үйлдвэрлэл эрхлэгч иргэн card tapped");
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.badge,
                              size: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 150, height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Өрхийн үйлдвэрлэл"),
                              Text("эрхлэгч иргэн"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text(
                  "Буцах",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.cyan),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

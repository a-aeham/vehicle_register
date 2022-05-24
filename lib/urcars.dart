import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_web_android_studioo/report.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart' if (dart.library.html) 'web.dart';

class UrCars extends StatefulWidget {
  const UrCars({Key key}) : super(key: key);

  @override
  State<UrCars> createState() => _UrCarsState();
}

class _UrCarsState extends State<UrCars> {
  final Stream<QuerySnapshot> urcars =
      FirebaseFirestore.instance.collection('vehicle').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          elevation: 5,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.3,
                height: MediaQuery.of(context).size.height,
                color: Colors.yellow[600],
                child: Padding(
                  padding: const EdgeInsets.all(70),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('images/MOI.png'),
                          radius: 110,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "مديرية المرور العامة",
                          style: TextStyle(
                            fontFamily: 'amiri',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "إستمارة تسجيل المركبات",
                          style: TextStyle(
                            fontFamily: 'amiri',
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('images/mror.jpg'),
                          radius: 70,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    50,
                    40,
                    70,
                    40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'المركبات المسجلة',
                        style: TextStyle(
                          fontFamily: 'sh',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: StreamBuilder(
                          stream: urcars,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot,
                          ) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (_, index) {
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  color:
                                      const Color.fromARGB(255, 248, 250, 252),
                                  elevation: 5,
                                  shadowColor: Colors.blue[50],
                                  child: ListTile(
                                      title: Text(
                                        snapshot.data.docs[index]['brand'],
                                        style: TextStyle(fontFamily: 'amiri'),
                                      ),
                                      subtitle: Text(
                                        snapshot.data.docs[index]['model'],
                                        style: TextStyle(fontFamily: 'amiri'),
                                      ),
                                      trailing: Text(
                                        snapshot.data.docs[index]['bodyNumber'],
                                        style: TextStyle(
                                          fontFamily: 'amiri',
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) {
                                              return Reportt(
                                                baseNum: snapshot.data
                                                    .docs[index]['baseNumber'],
                                                bodyNum: snapshot.data
                                                    .docs[index]['bodyNumber'],
                                                motorNum: snapshot.data
                                                    .docs[index]['MotorNumber'],
                                                city: snapshot.data.docs[index]
                                                    ['city'],
                                                type: snapshot.data.docs[index]
                                                    ['type '], 
                                                serial: snapshot
                                                    .data.docs[index]['serial'],
                                                clas: snapshot.data.docs[index]
                                                    ['clas'],
                                                brand: snapshot.data.docs[index]
                                                    ['brand'],
                                                model: snapshot.data.docs[index]
                                                    ['model'],
                                                year: snapshot.data.docs[index]
                                                    ['year'],
                                                made: snapshot.data.docs[index]
                                                    ['made'],
                                                capacity: snapshot.data
                                                    .docs[index]['capacity'],
                                                hourse: snapshot
                                                    .data.docs[index]['hourse'],
                                                cylinder: snapshot.data
                                                    .docs[index]['cylinder'],
                                                fuel: snapshot.data.docs[index]
                                                    ['fuel'],
                                                color: snapshot.data.docs[index]
                                                    ['color'],
                                                gamb: snapshot.data.docs[index]
                                                    ['gamb'],
                                                bodyType: snapshot.data
                                                    .docs[index]['bodyType'],
                                                axels: snapshot.data.docs[index]
                                                    ['axels'],
                                                cookpit: snapshot.data
                                                    .docs[index]['cookpit'],
                                                wheel: snapshot.data.docs[index]
                                                    ['wheel'],
                                                    
                                              );
                                            }),
                                          ),
                                        );
                                      }),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<int>> _readFontData() async {
    final ByteData bytes = await rootBundle.load('fonts/arial.ttf');
    return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

  Future<void> createPdf({
    String baseNum,
    String bodyNum,
    String motorNum,
    String city,
    String type,
    String serial,
    String clas,
    String brand,
    String model,
    String year,
    String made,
    String capacity,
    String hourse,
    String cylinder,
    String fuel,
    String color,
    String passengers,
    String gamb,
    String bodyType,
    String axels,
    String cookpit,
    String wheel,
  }) async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    PdfGraphics graphics = page.graphics;
    PdfFont font = PdfTrueTypeFont(await _readFontData(), 12);
    graphics.drawString(baseNum, font,
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
            0, 0, page.getClientSize().width, page.getClientSize().height),
        format: PdfStringFormat(
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

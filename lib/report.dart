import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart' if (dart.library.html) 'web.dart';

class Reportt extends StatelessWidget {
  String baseNum;
  String bodyNum;
  String motorNum;
  String city;
  String type;
  String serial;
  String clas;
  String brand;
  String model;
  String year;
  String made;
  String capacity;
  String hourse;
  String cylinder;
  String fuel;
  String color;
  String passengers;
  String gamb;
  String bodyType;
  String axels;
  String cookpit;
  String wheel;
  Reportt(
      {this.baseNum,
      this.bodyNum,
      this.motorNum,
      this.city,
      this.type,
      this.serial,
      this.clas,
      this.brand,
      this.model,
      this.year,
      this.made,
      this.capacity,
      this.hourse,
      this.cylinder,
      this.fuel,
      this.color,
      this.passengers,
      this.gamb,
      this.bodyType,
      this.axels,
      this.cookpit,
      this.wheel});

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
    String gamb,
    String bodyType,
    String axels,
    String cookpit,
    String wheel,
  }) async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    PdfGraphics graphics = page.graphics;
    PdfFont font = PdfTrueTypeFont(await _readFontData(), 16);

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('mror.jpg')),
        Rect.fromLTWH(300, 0, 250, 150));

    graphics.drawString(
        '\n \n \n \n \n \n رقم الشاصي : $baseNum \n رقم البدن : $bodyNum \n رقم المحرك : $motorNum \n ****معلومات لوحة التسجيل*** \n المحافظة : $city \n صنف التسجيل : $type \n تسلسل التسجيل : $serial \n ***البيانات الفنية للمركبة*** \n فئة التسجيل : $clas \n الماركة الرئيسية : $brand \n النوعية : $model \n سنة الصنع : $year \n بلد الصنع : $made \n سعة المحرك : $capacity \n القدرة الحصانية : $hourse \n عدد الاسطوانات : $cylinder \n نوع الوقود : $fuel \n اللون : $color \n عدد الركاب : $passengers \n وصف القمارة : $gamb \n نوع البدن : $bodyType \n عدد المحاور : $axels \n وصف مجموعة القيادة : $cookpit \n نوع العجلات : $wheel \n ',
        font,
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
            0, 0, page.getClientSize().width, page.getClientSize().height),
        format: PdfStringFormat(
            lineSpacing: 10,
            textDirection: PdfTextDirection.rightToLeft,
            alignment: PdfTextAlignment.right,
            paragraphIndent: 35));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<List<int>> _readFontData() async {
    final ByteData bytes = await rootBundle.load('fonts/arial.ttf');
    return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

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
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.yellow[600],
                  child: SingleChildScrollView(
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'تفاصيل المركبة',
                          style: TextStyle(
                            fontFamily: 'sh',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        InfoText(
                          label: 'الماركة الرئيسية : ',
                          info: brand,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoText(
                          label: 'الماركة الفرعية : ',
                          info: model,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoText(
                          label: 'اللون : ',
                          info: color,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InfoText(
                          label: 'سنة الصنع  : ',
                          info: year,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoText(label: 'بلد الصنع : ', info: made),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoText(
                          label: 'المحافظة : ',
                          info: city,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoText(
                          label: 'صنف التسجيل : ',
                          info: type,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoText(
                          label: 'تسلسل التسجيل  : ',
                          info: serial,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          color: const Color(0xFF6dd0f4),
                          onPressed: () {
                            createPdf(
                              baseNum: baseNum,
                              bodyNum: bodyNum,
                              motorNum: motorNum,
                              city: city,
                              type: type,
                              serial: serial,
                              clas: clas,
                              brand: brand,
                              model: model,
                              year: year,
                              made: made,
                              capacity: capacity,
                              hourse: hourse,
                              cylinder: cylinder,
                              fuel: fuel,
                              color: color,
                              gamb: gamb,
                              bodyType: bodyType,
                              axels: axels,
                              cookpit: cookpit,
                              wheel: wheel,
                            );
                          },
                          child: const Text(
                            "طباعة",
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'sh',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  String label;
  String info;
  InfoText({this.label, this.info});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 140.0,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: 'amiri',
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(
          width: 40.0,
        ),
        SizedBox(
          width: 140.0,
          child: Text(
            info,
            style: const TextStyle(
              fontSize: 18.0,
              fontFamily: 'amiri',
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }
}

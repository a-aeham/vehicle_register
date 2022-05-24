import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_web_android_studioo/controller.dart';
import 'package:first_web_android_studioo/urcars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_field.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  UploadTask task;
  String fileUrl = '';
  File file;

  Future selectFile() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    var path = result.files.single.path.toString();
    setState(() {
      file = File(path);
    });
    print('**********************************');
    print('File : $file');
  }

  Future uploadFile() async {
    // get file
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null && result.files.isNotEmpty) {
      final fileBytes = result.files.first.bytes;
      final fileName = result.files.first.name;

      // upload file
      await FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName')
          .putData(fileBytes);
    }
  }

  bool gamb1 = false;
  bool gamb2 = false;
  bool gamb3 = false;
  bool gamb4 = false;
  bool gamb5 = false;
  bool gamb6 = false;

  bool bodyType1 = false;
  bool bodyType2 = false;

  bool cookpit1 = false;
  bool cookpit2 = false;

  bool wheel1 = false;
  bool wheel2 = false;

  TextEditingController baseNumController = TextEditingController();
  TextEditingController bodyNumController = TextEditingController();
  TextEditingController motorNumController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController serialController = TextEditingController();

  TextEditingController clasController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController madeController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController cylinderController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController passengersController = TextEditingController();
  String gamb = '';
  String bodyType = '';
  TextEditingController axelsController = TextEditingController();
  String cookpit = '';
  String wheel = '';

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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      50,
                      40,
                      70,
                      40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'البيانات الاساسية للمركبة',
                          style: TextStyle(
                            fontFamily: 'sh',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const SizedBox(height: 20.0),
                        InputField(
                          label: "رقم الشاصي (القاعدة)",
                          content: "AAAAAAAAAAAAAAAAA",
                          controller: baseNumController,
                          inputFormatters: LengthLimitingTextInputFormatter(17),
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          label: "رقم القمارة (البدن)",
                          content: "AAAAAAAAAAAAAAAAA",
                          controller: bodyNumController,
                          inputFormatters: LengthLimitingTextInputFormatter(17),
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          label: "رقم المحرك",
                          content: "######",
                          controller: motorNumController,
                          inputFormatters: LengthLimitingTextInputFormatter(6),
                        ),

                        const SizedBox(height: 20.0),

                        const Text(
                          'معلومات اللوحة (رقم التسجيل)',
                          style: TextStyle(
                            fontFamily: 'sh',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: cityController,
                          inputFormatters: LengthLimitingTextInputFormatter(10),
                          label: "المحافظة",
                          content: "نينوى",
                        ),

                        const SizedBox(height: 20.0),

                        //InputField Widget from the widgets folder
                        InputField(
                          controller: typeController,
                          inputFormatters: LengthLimitingTextInputFormatter(9),
                          label: "صنف التسجيل",
                          content: "خصوصي",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: serialController,
                          inputFormatters: LengthLimitingTextInputFormatter(7),
                          label: "تسلسل التسجيل",
                          content: "أ000000",
                        ),

                        const SizedBox(height: 20.0),

                        const Text(
                          'البيانات الفنية للمركبة',
                          style: TextStyle(
                            fontFamily: 'sh',
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: clasController,
                          inputFormatters: LengthLimitingTextInputFormatter(24),
                          label: "فئة التسجيل",
                          content: "#####",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: brandController,
                          inputFormatters: LengthLimitingTextInputFormatter(12),
                          label: "الماركة الرئيسية",
                          content: "GELLY",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: modelController,
                          inputFormatters: LengthLimitingTextInputFormatter(12),
                          label: "الماركة الفرعية",
                          content: "CK",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: yearController,
                          inputFormatters: LengthLimitingTextInputFormatter(4),
                          label: "سنة الصنع",
                          content: "####",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: madeController,
                          inputFormatters: LengthLimitingTextInputFormatter(24),
                          label: "بلد الصنع",
                          content: "الصين",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: capacityController,
                          inputFormatters: LengthLimitingTextInputFormatter(6),
                          label: "سعة المحرك",
                          content: "####",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: hoursController,
                          inputFormatters: LengthLimitingTextInputFormatter(6),
                          label: "القدرة الحصانية",
                          content: "###",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: cylinderController,
                          inputFormatters: LengthLimitingTextInputFormatter(2),
                          label: "عدد الاسطوانات",
                          content: "#",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: fuelController,
                          inputFormatters: LengthLimitingTextInputFormatter(8),
                          label: "نوع الوقود",
                          content: "بانزين",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: colorController,
                          inputFormatters: LengthLimitingTextInputFormatter(8),
                          label: "اللون",
                          content: "أحمر",
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: passengersController,
                          inputFormatters: LengthLimitingTextInputFormatter(2),
                          label: "عدد الركاب",
                          content: "#",
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: [
                            const SizedBox(
                              width: 140.0,
                              child: Text(
                                'وصف القمارة ',
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: 'amiri'),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'بدون قمارة',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: gamb1,
                                      onSelected: (value) {
                                        setState(() {
                                          gamb1 = true;
                                          gamb2 = false;
                                          gamb3 = false;
                                          gamb4 = false;
                                          gamb5 = false;
                                          gamb6 = false;
                                          gamb = 'بدون قمارة';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'قمارة متعددة المقاعد',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: gamb2,
                                      onSelected: (value) {
                                        setState(() {
                                          gamb1 = false;
                                          gamb2 = true;
                                          gamb3 = false;
                                          gamb4 = false;
                                          gamb5 = false;
                                          gamb6 = false;
                                          gamb = 'قمارة متعددة المقاعد';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'قمارة مزدوجة',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: gamb3,
                                      onSelected: (value) {
                                        setState(() {
                                          gamb1 = false;
                                          gamb2 = false;
                                          gamb3 = true;
                                          gamb4 = false;
                                          gamb5 = false;
                                          gamb6 = false;
                                          gamb = 'قمارة مزدوجة';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //************************************** */
                                Row(
                                  children: [
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'قمارة مفردة',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: gamb4,
                                      onSelected: (value) {
                                        setState(() {
                                          gamb1 = false;
                                          gamb2 = false;
                                          gamb3 = false;
                                          gamb4 = true;
                                          gamb5 = false;
                                          gamb6 = false;
                                          gamb = 'قمارة مفردة';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'قمارة وربع',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: gamb5,
                                      onSelected: (value) {
                                        setState(() {
                                          gamb1 = false;
                                          gamb2 = false;
                                          gamb3 = false;
                                          gamb4 = false;
                                          gamb5 = true;
                                          gamb6 = false;
                                          gamb = 'قمارة وربع';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'قمارة ونصف',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: gamb6,
                                      onSelected: (value) {
                                        setState(() {
                                          gamb1 = false;
                                          gamb2 = false;
                                          gamb3 = false;
                                          gamb4 = false;
                                          gamb5 = false;
                                          gamb6 = true;
                                          gamb = 'قمارة ونصف';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: [
                            const SizedBox(
                              width: 140.0,
                              child: Text(
                                'نوع البدن ',
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: 'amiri'),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'اعتيادي',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: bodyType1,
                                      onSelected: (value) {
                                        setState(() {
                                          bodyType1 = true;
                                          bodyType2 = false;
                                          bodyType = 'اعتيادي';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'مصفح',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: bodyType2,
                                      onSelected: (value) {
                                        setState(() {
                                          bodyType1 = false;
                                          bodyType2 = true;
                                          bodyType = 'مصفح';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20.0),

                        InputField(
                          controller: axelsController,
                          inputFormatters: LengthLimitingTextInputFormatter(2),
                          label: "عدد المحاور",
                          content: "##",
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: [
                            const SizedBox(
                              width: 140.0,
                              child: Text(
                                'وصف مجموعة القيادة ',
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: 'amiri'),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'اعتيادية',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: cookpit1,
                                      onSelected: (value) {
                                        setState(() {
                                          cookpit1 = true;
                                          cookpit2 = false;
                                          cookpit = 'اعتيادية';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'محور ذوي الاحتياجات الخاصة',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: cookpit2,
                                      onSelected: (value) {
                                        setState(() {
                                          cookpit1 = false;
                                          cookpit2 = true;
                                          cookpit =
                                              'محور ذوي الاحتياجات الخاصة';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: [
                            const SizedBox(
                              width: 140.0,
                              child: Text(
                                'نوع العجلات',
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: 'amiri'),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'اعتيادية',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: wheel1,
                                      onSelected: (value) {
                                        setState(() {
                                          wheel1 = true;
                                          wheel2 = false;
                                          wheel = 'اعتيادية';
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ChoiceChip(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.blue.shade50,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.blue.shade50,
                                      selectedColor: const Color(0xFFfdd734),
                                      //avatar: agrMosulIcon,
                                      label: const Text(
                                        'مسرفة',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'amiri'),
                                      ),
                                      selected: wheel2,
                                      onSelected: (value) {
                                        setState(() {
                                          wheel1 = false;
                                          wheel2 = true;
                                          wheel = 'مسرفة';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 180.0,
                            ),
                            FlatButton(
                              color: const Color(0xFFfdd734),
                              onPressed: () {
                                selectFile();
                              },
                              child: const Text(
                                "ارفاق استمارة الفحص",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'sh',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            FlatButton(
                              color: const Color(0xFFfdd734),
                              onPressed: () {
                                selectFile();
                              },
                              child: const Text(
                                "ارفاق المستمسكات الشخصية",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'sh',
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 180.0,
                            ),
                            MaterialButton(
                              color: const Color(0xFF6dd0f4),
                              onPressed: () {
                                // uploadFile();
                                DetailsController().uploadDetails(
                                  baseNumController.text,
                                  bodyNumController.text,
                                  motorNumController.text,
                                  cityController.text,
                                  typeController.text,
                                  serialController.text,
                                  clasController.text,
                                  brandController.text,
                                  modelController.text,
                                  yearController.text,
                                  madeController.text,
                                  capacityController.text,
                                  hoursController.text,
                                  cylinderController.text,
                                  fuelController.text,
                                  colorController.text,
                                  passengersController.text,
                                  gamb,
                                  bodyType,
                                  axelsController.text,
                                  cookpit,
                                  wheel,
                                );
                                print('Details Uploaded');
                                setState(() {
                                  baseNumController.clear();
                                  bodyNumController.clear();
                                  motorNumController.clear();
                                  cityController.clear();
                                  typeController.clear();
                                  serialController.clear();
                                  clasController.clear();
                                  brandController.clear();
                                  modelController.clear();
                                  yearController.clear();
                                  madeController.clear();
                                  capacityController.clear();
                                  hoursController.clear();
                                  cylinderController.clear();
                                  fuelController.clear();
                                  colorController.clear();
                                  passengersController.clear();
                                  gamb = '';
                                  bodyType = '';
                                  axelsController.clear();
                                  cookpit = '';
                                  wheel = '';
                                });
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const UrCars();
                                }));
                              },
                              child: const Text(
                                "ارسال البيانات",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'sh',
                                ),
                              ),
                            ),
                          ],
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

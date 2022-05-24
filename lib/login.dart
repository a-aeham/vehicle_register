import 'package:first_web_android_studioo/add_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController verifyNumberController = TextEditingController();

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
              Container(
                padding: const EdgeInsets.only(
                    top: 40.0, right: 70.0, left: 50.0, bottom: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontFamily: 'sh',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    InputField(
                      inputFormatters: LengthLimitingTextInputFormatter(6),
                      controller: verifyNumberController,
                      label: "رمز التأكيد",
                      content: "123456",
                    ),

                    const SizedBox(height: 20.0),

                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 178.0,
                        ),
                        
                        FlatButton(
                          color: Color(0xFF6dd0f4),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const AddVehicle();
                            }));
                          },
                          child: const Text(
                            "تسجيل الدخول",
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
            ],
          ),
        ),
      ),
    );
  }
}

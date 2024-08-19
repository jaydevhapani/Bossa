import 'dart:convert';

import 'package:Bossa/network/api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Bossa/commonWidgets/button.dart';
import 'package:Bossa/commonWidgets/textField.dart';
import 'package:Bossa/ui/new_password.dart';
import 'package:Bossa/util/SizeConfig.dart';
import 'package:Bossa/util/common_methods.dart';

import '../util/main_app_bar.dart';

// ignore: must_be_immutable
class EnterCode extends StatefulWidget {
  bool? isForgot;
  var code;
  var uuid;
  String? email;
  EnterCode({Key? key, this.code, this.uuid, this.isForgot, this.email})
      : super(key: key);

  @override
  _EnterCodeState createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {
  TextEditingController enterCode = TextEditingController();

String newCode='';
  @override
  Widget build(BuildContext context) {
    print("details of forgot password");
    print(widget.code);
    print(widget.uuid);

    return SafeArea(
      child: Scaffold(
        appBar: MainAppBar(
            widget.isForgot! ? "Forgot Password" : "Change Password",
            false,
            null),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Please enter the code you received via SMS",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2.7,
                              color: const Color(0xff0E0B20),
                              height: SizeConfig.blockSizeVertical * 0.28,
                              fontFamily: 'Muli-Light'),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Enter Code*",
                              style: TextStyle(
                                  color: const Color(0xff0E0B20),
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockSizeVertical * 3.6,
                                  fontFamily: 'Muli-SemiBold'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        CommonTextField(
                          hintText: "Enter Code",
                          controller: enterCode,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 3,
                        ),
                        Center(
                            child: CustomButton(
                          text: "NEXT",
                          onTap: () async {
                            if (widget.code == enterCode.text||newCode==enterCode.text) {
                              Get.to(() => NewPassword(
                                    uuid: widget.uuid,
                                    isForgot: widget.isForgot,
                                  ));
                            } else {
                              CommonMethods()
                                  .showFlushBar("Invalid code enter", context);
                            }
                          },
                        )),
                        SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 2.7,
                                color: const Color(0xff0E0B20),
                                height: SizeConfig.blockSizeVertical * 0.18,
                                fontFamily: 'Muli-Bold'),
                            children: <TextSpan>[
                              TextSpan(text: 'Didn\'t receive code? '),
                              TextSpan(
                                text: 'SEND AGAIN',
                                style: TextStyle(
                                  color: Color(0xffEDCC40),
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    try {
                                      var res = await Api.forgotPassword(
                                          widget.email.toString());

                                      print(res);
                                      print(res.runtimeType);
                                      Map valueMap = jsonDecode(res);
                                      newCode=valueMap['code'];

                                      switch (valueMap['status']) {
                                        case "success":
                                          setState(() {
                                            // loading = false;
                                          });
                                          Get.to(() => EnterCode(
                                              code: valueMap['code'],
                                              uuid: valueMap['uuid'],
                                              isForgot: widget.isForgot));
                                          break;
                                        case "failed":
                                          setState(() {
                                            // loading = false;
                                          });
                                          CommonMethods().showFlushBar(
                                              "Your email doesn't exist",
                                              context);
                                          break;
                                        default:
                                          print("Something went wrong");
                                      }
                                    } catch (e) {
                                      print("error: $e");
                                    }
                                  },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_text_styles.dart';

class PasswordCodeScreen extends StatefulWidget {
  const PasswordCodeScreen({Key? key}) : super(key: key);

  @override
  _PasswordCodeScreenState createState() => _PasswordCodeScreenState();
}

class _PasswordCodeScreenState extends State<PasswordCodeScreen> {
  int _counter = 60;
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    _startTimer();
    // TODO: implement initState
    super.initState();
  }
  int ?lengInput;
  bool cont=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(new FocusNode()),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(
                'Введите код подтверждения',
                style: AppTextStyles.black24SemiBold,
              ),
              SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Введите 6-значный код, который мы отправили на номер +996 705 779 778.',
                      style: AppTextStyles.black16Medium,
                    ),
                    TextSpan(
                      style: AppTextStyles.link16Medium,
                      text: 'Запросить новый.',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        cont=true;
                        setState(() {
                          _counter=60;
                        });
                        _startTimer();
                          /*launch(
                              'https://drive.google.com/file/d/1EM0uL4W4s605Ou1R3irKuURsvKjxgu4U/view?usp=sharing');*/
                        },
                    ),
                  ],
                ),
              ),
              Text(
                '$_counter',
                style: AppTextStyles.black14Medium,
              ),
              SizedBox(height: 40),
              /*Padding(
                  padding: const EdgeInsets.symmetric(
                       horizontal: 30),
                  child: PinCodeTextField(
                    backgroundColor: Colors.white,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      fontSize: 20,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    validator: (v) {
                      if (v!.length < 6) {
                        setState(() {
                          lengInput=v.length;
                        });
                        return "Пожалуйста введите 6 цифр";
                      } else {
                        return null;
                      }
                    },

                    pinTheme: PinTheme(

                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      // activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: false,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        // currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),*/
              //
              // Padding(
              //     padding: const EdgeInsets.symmetric(
              //         vertical: 8.0, horizontal: 30),
              //     child: PinCodeTextField(
              //       backgroundColor: Colors.white,
              //
              //       appContext: context,
              //       pastedTextStyle: TextStyle(
              //         color: Colors.green.shade600,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       length: 6,
              //       obscureText: false,
              //       blinkWhenObscuring: true,
              //       animationType: AnimationType.fade,
              //       validator: (v) {
              //         if (v!.length < 3) {
              //           return "Пожалуйста введите 6 цифр";
              //         } else {
              //           return null;
              //         }
              //       },
              //       pinTheme: PinTheme(
              //         shape: PinCodeFieldShape.underline,
              //         borderRadius: BorderRadius.circular(5),
              //         fieldHeight: 50,
              //         fieldWidth: 40,
              //         activeFillColor: Colors.white,
              //         inactiveFillColor: Colors.white,
              //         selectedFillColor: Colors.white
              //       ),
              //       cursorColor: Colors.black,
              //       animationDuration: const Duration(milliseconds: 300),
              //       enableActiveFill: true,
              //       keyboardType: TextInputType.number,
              //       onCompleted: (v) {
              //         debugPrint("Completed");
              //       },
              //       // onTap: () {
              //       //   print("Pressed");
              //       // },
              //       onChanged: (value) {
              //         debugPrint(value);
              //         setState(() {
              //         });
              //       },
              //       beforeTextPaste: (text) {
              //         debugPrint("Allowing to paste $text");
              //         //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //         //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //         return true;
              //       },
              //     )),


              if (cont)...[
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF0E77EF),
                  ),
                  child: Text('Код отправлен повторно',style: AppTextStyles.white16Regular,),
                )
        ],
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordCodeScreen(),
                    ),
                  );*/

                },
                child: Text(
                  'Далее',
                  style: AppTextStyles.white16Medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

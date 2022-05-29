import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netex25_05_2022/src/module/screen/password/passwordCodeScreen.dart';

import '../../../theme/app_text_styles.dart';


class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String text =
      'Введите свой номер телефона, и мы отправим вам код, чтобы вы могли восстановить доступ к аккаунту.';
  phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   Strings.phoneNumber,
        //   style: AppTextStyles.kRobotoReg12ColorBlack500,
        // ),
        SizedBox(
          height: 4.h,
        ),
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Номер телефона',
            hintStyle: AppTextStyles.hint16Medium,
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(new FocusNode()),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Не удается выполнить вход?',
                style: AppTextStyles.black24SemiBold,
              ),
              SizedBox(height: 40.h),
              Text(
                text,
                style: AppTextStyles.black16Medium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              phoneField(),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordCodeScreen(),
                    ),
                  );

                },
                child: Text(
                  'Далее',
                  style: AppTextStyles.white16Medium,
                ),
              ),
              SizedBox(height: 326.h),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Text('Вернуться к входу',style: AppTextStyles.blackGrey16Regular,))
            ],
          ),
        ),
      ),
    );
  }
}

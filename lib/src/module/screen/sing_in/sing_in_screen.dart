import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/app_text_styles.dart';
import '../password/password_screen.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  bool passwordObscured = true;

  phoneField() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        hintText: 'temakonkin@gmail.com',
        hintStyle: AppTextStyles.hint16Medium,
        border: OutlineInputBorder(),
      ),
    );
  }

  passwordField() {
    return TextFormField(
      autofocus: false,
      obscureText: passwordObscured,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Пароль',
        hintStyle: AppTextStyles.hint16Medium,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              passwordObscured = !passwordObscured;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(11.w),
            child: SvgPicture.asset(
              passwordObscured
                  ? 'assets/icons/password_hidden.svg'
                  : 'assets/icons/password.svg'
            ),
          ),
        ),
      ),
    );
  }

  bool check=false;

  politikConf(){
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              check = !check;
            });
          },
          child: Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: check
                  ? Colors.yellow
                  : Color(0xFFE0E0E0),
            ),
            child: check
                ? Center(
              child: Icon(Icons.check,
                  color: Colors.white, size: 15),
            )
                : Center(),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RichText(
            text: TextSpan(
              children: [
                 TextSpan(
                  text: 'Согласен ',
                  style: AppTextStyles.black16Medium,
                ),

                TextSpan(
                  text: ' сайта и ',
                  style: AppTextStyles.black16Medium,
                ),

                 TextSpan(
                  text: ' '
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

  forgotPassword(){
    return Center(
      child: RichText(
        text:  TextSpan(
          children: [
            TextSpan(
              text: 'Забыл(a) пароль?',
              style: AppTextStyles.black16Medium,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordScreen(),
                    ),
                  );
                },
            ),

          ],
        ),
      ),
    );
  }

  registration(){
    return Center(
      child: RichText(
        text: new TextSpan(
          children: [
            new TextSpan(
              text: 'Впервые у нас? ',
              style: AppTextStyles.blackGrey16Regular,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),

          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Авторизация'),),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(new FocusNode()),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            Container(

                child: Image(image: AssetImage('assets/first.png',),

                ),

            ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      Text(
                        'Вход в аккаунт',
                        style: AppTextStyles.kRobotoReg40ColorBlack600,
                      ),
                     SizedBox(height: 8.h),
                Text(
                  'Ввеите свои данные для авторизации',
                  style: AppTextStyles.black16Medium,
                ),
                     SizedBox(height: 16.h),
                      Text(
                        'Email',
                        style: AppTextStyles.black16Medium,
                      ),
                SizedBox(height: 16.h),
                phoneField(),
                     SizedBox(height: 16.h),
                     Text(
                       'Пароль',
                       style: AppTextStyles.black16Medium,
                     ),
                     SizedBox(height: 16.h),

                passwordField(),
                SizedBox(height: 24.h),

                    ],
            ),
          ),
                Center(
                  child: ElevatedButton(
style: ElevatedButton.styleFrom(
  primary: Colors.yellow
),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Main(),
                      //   ),
                      //);

                    },
                    child: Text(
                      'Войти',
                      style: AppTextStyles.white16Medium,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                forgotPassword(),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Еще нет аккаунта?'),
                    Text('Зарегистрироваться'),
                  ],
                ),
                SizedBox(height: 24.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

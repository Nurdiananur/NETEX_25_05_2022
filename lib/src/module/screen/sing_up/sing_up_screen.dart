import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool passwordObscured = true;
  bool confirmObscured=false;

  phoneField() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Номер телефона',
        hintStyle: AppTextStyles.hint16Medium,
      ),
    );
  }

  passwordField() {
    return TextFormField(
      autofocus: false,
      obscureText: passwordObscured,
      decoration: InputDecoration(
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
  confirmField() {
    return TextFormField(
      autofocus: false,
      obscureText: confirmObscured,
      decoration: InputDecoration(
        hintText: 'Повторите пароль',
        hintStyle: AppTextStyles.hint16Medium,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              confirmObscured = !confirmObscured;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(11.w),
            child: SvgPicture.asset(
                confirmObscured
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
                  ? Color(0xFF3D8BFF)
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
            text: new TextSpan(
              children: [
                new TextSpan(
                  text: 'Согласен ',
                  style: AppTextStyles.black16Medium,
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
        text: new TextSpan(
          children: [
            new TextSpan(
              text: 'Забыли пароль',
              style: AppTextStyles.mainColor16SemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),

          ],
        ),
      ),
    );
  }

  singIn(){
    return Center(
      child: RichText(
        text: new TextSpan(
          children: [
            new TextSpan(
              text: 'Уже есть аккаунт? ',
              style: AppTextStyles.blackGrey16Regular,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),
            new TextSpan(
              text: 'Войти',
              style: AppTextStyles.mainColor16SemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                    Navigator.pop(context);
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(new FocusNode()),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Регистрация',
                  style: AppTextStyles.kRobotoReg40ColorBlack600,
                ),

                SizedBox(
                  height: 4.h,
                ),
                phoneField(),
                SizedBox(height: 24.h),
                Text(
                  'Создайте пароль',
                  style: AppTextStyles.kRobotoReg12ColorBlack500,
                ),
                SizedBox(height: 4.h),
                passwordField(),
                SizedBox(height: 24.h),
                Text(
                  "Повторите пароль",
                  style: AppTextStyles.kRobotoReg12ColorBlack500,
                ),
                SizedBox(height: 4.h),
                confirmField(),
                SizedBox(height: 24.h),
                politikConf(),
                SizedBox(height: 48.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          horizontal: 118,
                          vertical: 15,
                        ),
                      ),
                    ),
                    child: Text(
                      'Регистрация',
                      style: AppTextStyles.white16Medium,
                    ),
                  ),
                ),
                SizedBox(height: 110.h),
                singIn(),
                SizedBox(height: 58.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  margin: EdgeInsets.only(right: 10.w, top: 10.w, bottom: 10.h),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Container(
                    // width: 62,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const FadeInImage(
                        placeholder: AssetImage('assets/ic_no_photo_blue.png'),
                        image: AssetImage('assets/ic_no_photo_blue.png'),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  'haikalharin1998@gmail.com',
                  style: TextStyle(fontSize: 24, color: Colors.black38),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

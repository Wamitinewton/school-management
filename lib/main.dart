import 'package:flutter/material.dart';
import 'package:sms/Screens/home/adminpages/addstudent.dart';
import 'package:sms/Screens/home/assigments/assignment_class_folder.dart';
import 'package:sms/Screens/home/assigments/student_assignment_upload.dart';
import 'package:sms/Screens/home/attendance/attendance_model.dart';
import 'package:sms/Screens/home/attendance/teacher_attendence.dart';
import 'package:sms/Screens/home/fees/fee_information.dart';
import 'package:sms/Screens/forms.dart';
import 'package:sms/Screens/home/home_page/home_page.dart';
import 'package:sms/Screens/home/attendance/attendance.dart';
import 'package:sms/Screens/home/profile/profile.dart';
import 'package:sms/Screens/intro/intro.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:sms/Screens/wrapper.dart';


import 'Screens/authentication/login_page.dart';
import 'Services/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBCvpkOBL4MC7EMyYiEexVfDUWIaa7y2ZE", 
      appId: "1:923227384506:android:a717dd8d272b39ba647083", 
      messagingSenderId: "923227384506", 
      projectId: "online-learning-bb966",
      storageBucket: "online-learning-bb966.appspot.com"
      )
  );
  runApp(const SMS());
}

class SMS extends StatefulWidget {
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: Common.checkPreviousVisit(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Text("Some error occure"),
                  ),
                ));
          }
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const Wrapper(),
                routes: {
                  '/home': (context) => const MyHomePage(),
                  '/form': (context) => EntryForm(),
                  '/login': (context) => LoginPage(),
                  '/profile': (context) => const Profile(),
                  'feeInfo': (context) => const FeeInformation(),
                  '/assignment_class': (context) => const AssignmentFolder(),
                  '/attendance': (context) => const Attendance(),
                  '/attendance_data': (context) => const UserInformation(),
                  '/student_upload' : (context) => const StudentAssignmentUpload(),
                  '/wrapper': (context) => const Wrapper(),
                  '/teacher_attendance':(context) => const TeacherAttendence(),
                  '/add_student':(context) => const AddStudent(),
                },
              );
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const IntroPage(),
                routes: {
                  '/home': (context) => const MyHomePage(),
                  '/form': (context) => EntryForm(),
                  '/login': (context) => LoginPage(),
                  '/profile': (context) => const Profile(),
                  'feeInfo': (context) => const FeeInformation(),
                  '/assignment_class': (context) => const AssignmentFolder(),
                  '/attendance': (context) => const Attendance(),
                  '/attendance_data': (context) => const UserInformation(),
                  '/wrapper': (context) => const Wrapper(),
                  '/teacher_attendance':(context) => const TeacherAttendence(),
                  '/add_student':(context) => const AddStudent(),
                },
              );
            }
          }
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
              home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Processing"),
                ],
              ),
            ),
          ));
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/utils/assets_manager.dart';
import 'package:todo/core/utils/constants_manager.dart';
import 'package:todo/core/utils/text_styles.dart';
import '../widgets/customed_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  AssetsManager.route,
                  width: 237.w,
                  height: 71.h,
                ),

                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Email address',
                  style: LightTxtStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomedTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter emil';
                    }
                    // if (!isValidEmail(input)) {
                    //   // email is not Valid
                    //   return 'Email bad format';
                    // }
                    return null;
                  },
                  controller: emailController,
                  hintText: ConstantManager.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Password',
                  style: LightTxtStyles.title,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomedTextField(
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter password';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: ConstantManager.password,
                  keyboardType: TextInputType.visiblePassword,
                  isSecureText: true,
                ), // password

                SizedBox(
                  height: 12.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        padding: REdgeInsets.symmetric(vertical: 11)),
                    onPressed: () {
                      //login();
                    },
                    child: Text(
                      'Sign-In',
                      style: LightTxtStyles.buttonText,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

//   void login() async {
//     if (formKey.currentState?.validate() == false) return;
//
//     try {
//       // show Loading
//       MyDialog.showLoading(context,
//           loadingMessage: 'Waiting...', isDismissible: false);
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       UserDM.currentUser = await readUserFromFireStore(credential.user!.uid);
//
//       //hide loading
//       if (mounted) {
//         MyDialog.hide(context);
//       }
//       // show success message
//       if (mounted) {
//         MyDialog.showMessage(context,
//             body: 'User Logged in successfully',
//             posActionTitle: 'Ok', posAction: () {
//               Navigator.pushReplacementNamed(
//                 context,
//                 RoutesManager.home,
//               );
//             });
//       }
//     } on FirebaseAuthException catch (authError) {
//       if (mounted) {
//         MyDialog.hide(context);
//       }
//       late String message;
//       if (authError.code == ConstantManager.invalidCredential) {
//         message = StringsManager.wrongEmailOrPasswordMessage;
//       }
//       if (mounted) {
//         MyDialog.showMessage(
//           context,
//           title: 'Error',
//           body: message,
//           posActionTitle: 'OK',
//         );
//       }
//     } catch (error) {
//       if (mounted) {
//         MyDialog.hide(context);
//         MyDialog.showMessage(context,
//             title: 'Error',
//             body: error.toString(),
//             posActionTitle: 'Try again');
//       }
//     }
//   }
//
//   Future<UserDM> readUserFromFireStore(String uid) async {
//     CollectionReference usersCollection =
//     FirebaseFirestore.instance.collection(UserDM.collectionName);
//     DocumentReference userDocument = usersCollection.doc(uid);
//     DocumentSnapshot userDocumentSnapshot = await userDocument.get();
//     Map<String, dynamic> json =
//     userDocumentSnapshot.data() as Map<String, dynamic>;
//     UserDM userDM = UserDM.fromFireStore(json);
//     return userDM;
//   }
 }
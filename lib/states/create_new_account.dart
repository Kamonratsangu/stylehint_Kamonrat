import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterstylehint/model/user_model.dart';
import 'package:flutterstylehint/utility/app_dialoge.dart';
import 'package:flutterstylehint/widget/widget_button.dart';
import 'package:flutterstylehint/widget/widget_form.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';

class CreatenewAccount extends StatefulWidget {
  const CreatenewAccount({super.key});

  @override
  State<CreatenewAccount> createState() => _CreatenewAccountState();
}

class _CreatenewAccountState extends State<CreatenewAccount> {
  String? displayName, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const WidgetText(data: 'Create New Account'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                label: 'Display Name',
                changeFunc: (p0) {
                  displayName = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                label: 'Email',
                changeFunc: (p0) {
                  email = p0.trim();
                },
                textInputType: TextInputType.emailAddress,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetForm(
                label: 'Password',
                changeFunc: (p0) {
                  password = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                margin: const EdgeInsets.only(top: 8),
                child: WidgetButton(
                  label: 'Create New Account',
                  pressFunc: () async {
                    if ((displayName?.isEmpty ?? true) ||
                        (email?.isEmpty ?? true) ||
                        (password?.isEmpty ?? true)) {
                      AppDialog(context: context)
                          .normalDialog(title: 'Have Space ?');
                    } else {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email!, password: password!)
                          .then((value) async {
                        AppDialog(context: context).progressDialog();

                        String uid = value.user!.uid;
                        UserModel userModel = UserModel(
                            displayName: displayName!,
                            email: email!,
                            password: password!,
                            uid: uid, urlAvatar: '');

                        await FirebaseFirestore.instance
                            .collection('user')
                            .doc(uid)
                            .set(userModel.toMap())
                            .then((value) {
                              Get.back();
                              Get.back();
                            });
                      }).catchError((onError) {
                        AppDialog(context: context).normalDialog(
                            title: onError.code, subTitle: onError.message);
                      });
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

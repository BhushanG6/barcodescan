import 'package:flutter/material.dart';
import 'size_config.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpForm extends StatefulWidget {
  //const OtpForm({
  // Key key,
  // }) : super(key: key);
  final String phone;
  OtpForm(this.phone);
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  @override
  String _verificationCode;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Color.fromRGBO(246, 246, 246, 1),
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(14)),
    border: null,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: SingleChildScrollView(
              child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          margin:
              EdgeInsetsDirectional.only(top: getProportionateScreenHeight(400),bottom:getProportionateScreenHeight(0) ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            getProportionateScreenWidth(30),
                            getProportionateScreenHeight(30),
                            0.0,
                            0.0),
                        child: Text('Verification Details',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SF Pro Display',
                            )),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Container(
                        alignment: Alignment.center,
                        child: Text('Enter verification code',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF Pro Display',
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(30)),
                      child: PinPut(
                        fieldsCount: 4,
                        textStyle:
                            const TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                        eachFieldWidth: getProportionateScreenHeight(40),
                        eachFieldHeight: getProportionateScreenHeight(40),
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: BoxDecoration(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          borderRadius: BorderRadius.circular(14.0),
                          border: null,
                        ),
                        selectedFieldDecoration: BoxDecoration(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          borderRadius: BorderRadius.circular(14.0),
                          border: null,
                        ),
                        followingFieldDecoration: BoxDecoration(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          borderRadius: BorderRadius.circular(14.0),
                          border: null,
                        ),
                        pinAnimationType: PinAnimationType.fade,
                        onSubmit: (pin) async {
                          // try {
                          //   await FirebaseAuth.instance
                          //       .signInWithCredential(
                          //           PhoneAuthProvider.credential(
                          //               verificationId: _verificationCode,
                          //               smsCode: pin))
                          //       .then((value) async {
                          //     if (value.user != null) {}
                          //   });
                          // } catch (e) {
                          //   FocusScope.of(context).unfocus();
                          //   _scaffoldkey.currentState.showSnackBar(
                          //       SnackBar(content: Text('invalid OTP')));
                          // }
                        },
                      ),
                    )
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(40),
                      top: getProportionateScreenHeight(15)),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Resend verification code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(90)),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: getProportionateScreenWidth(210)),
                                height: getProportionateScreenHeight(46),
                                width: getProportionateScreenWidth(108),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(74, 144, 226, 1),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Next',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'SF Pro Display'),
                                          ),
                                          Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                                        ],
                                      ),
                                    ])),
                          ),
                ),
                SizedBox(height:getProportionateScreenHeight(20))
              ])
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {}
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_verifyPhone();
  }
}

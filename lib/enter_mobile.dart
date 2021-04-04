//import 'dart:html';
import 'package:barcodescan/otp_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'size_config.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:intl_phone_field/intl_phone_field.dart';
class EnterMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<EnterMobile> {
  String _mobileno;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Body:

  Widget _buildmobile() {
    return Container(
      width: getProportionateScreenWidth(315),
      child: IntlPhoneField(
   decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(10)),
            labelText: 'Mobile Number',
            labelStyle: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color.fromARGB(255, 69, 69, 69)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 69, 69, 69),
                width: 3,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              width: 3,
              color: Color.fromARGB(255, 69, 69, 69),
            ))),
    //initialCountryCode: 'IN',
    onChanged: (phone) {
        print(phone.completeNumber);
    },
)
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      //appBar: AppBar(title: Text("Form Demo")),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          margin: EdgeInsetsDirectional.only(
              top: getProportionateScreenHeight(350),bottom: getProportionateScreenHeight(0)),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
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
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(30)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildmobile(),
                      SizedBox(height: getProportionateScreenHeight(190)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return OtpForm(_mobileno);
                                  },
                                ),
                              );
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
                                          Icon(Icons.keyboard_arrow_right,color:Colors.white),
                                        ],
                                      ),
                                    ])),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

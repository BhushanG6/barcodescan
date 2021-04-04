import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcodescan/bottomNavigation.dart';
import 'package:barcodescan/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'enter_mobile.dart';
import 'size_config.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _firstname;
  String _lastname;
  String _mobileno;
  String _password;
  bool _checkbox1 = true;
  bool _checkbox2 = false;
  var gender = ' ';
  var tempdate;

  TextEditingController genderPicked = new TextEditingController();
  TextEditingController datePicked = new TextEditingController();

  DateTime dateTime = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Body:

  Widget _buildfirstName() {
    return Container(
      width: getProportionateScreenWidth(315),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,

        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(10)),
            labelText: 'First Name',
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
        //maxLength: 8,
        validator: (String value) {
          if (value.isEmpty) {
            return 'First name is Required';
          }
          final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
          if (!nameExp.hasMatch(value))
            return 'Please enter only alphabetical characters and spaces.';
          return null;
        },
        onSaved: (String value) {
          _firstname = value;
        },
      ),
    );
  }

  Widget _buildlastName() {
    return Container(
      width: getProportionateScreenWidth(315),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,

        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(10)),
            labelText: 'Last Name',
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
        //maxLength: 8,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Last name is Required';
          }
          final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
          if (!nameExp.hasMatch(value))
            return 'Please enter only alphabetical characters and spaces.';
          return null;
        },
        onSaved: (String value) {
          _lastname = value;
        },
      ),
    );
  }

  Widget _buildmobile() {
    return Container(
      width: getProportionateScreenWidth(315),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(10)),
            labelText: 'Mobile No',
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
        //maxLength: 8,
        validator: (String value) {
          if (value.isEmpty) {
            return 'First name is Required';
          }

          return null;
        },
        onSaved: (String value) {
          _mobileno = value;
        },
      ),
    );
  }

  Widget getGender() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
//alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(480)),
              height: getProportionateScreenHeight(320),
              width: double.infinity, //getProportionateScreenWidth(350),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //SizedBox(height: getProportionateScreenHeight(24)),
                  Center(
                    child: AutoSizeText(
                      'Select Gender',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                  ),

                  new Divider(
                    color: Colors.black,
                  ),
                  //SizedBox(height: getProportionateScreenHeight(11)),
                  Center(
                    child: Container(
                      height: getProportionateScreenHeight(110),
                      child: CupertinoPicker(
                        useMagnifier: true,
                        children: <Widget>[
                          AutoSizeText(
                            'Male',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500),
                          ),
                          AutoSizeText(
                            'Female',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500),
                          ),
                          AutoSizeText(
                            'Other',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                        itemExtent: getProportionateScreenHeight(50),
                        onSelectedItemChanged: (value) {
                          print(value);
                          if (value == 0) gender = 'Male';
                          if (value == 1) gender = 'Female';
                          if (value == 2) gender = 'Other';
                        },
                      ),
                    ),
                  ),
                  new Divider(
                    color: Colors.black,
                  ),
                  //SizedBox(height: getProportionateScreenHeight(11)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(width:getProportionateScreenWidth(10)),

                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10)),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              gender = ' ';
                              Navigator.pop(context);
                            },
                            child: AutoSizeText(
                              'Cancel',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(width:getProportionateScreenWidth(193)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(238)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: AutoSizeText(
                              'Confirm',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color.fromRGBO(54, 137, 212, 1),
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildgender() {
    return Container(
      width: getProportionateScreenWidth(142),
      child: TextFormField(
        controller: genderPicked,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(10)),
            labelText: 'Gender',
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
        //maxLength: 8,
        // controller: dateCtl,
        onTap: () async {
          FocusScope.of(context).requestFocus(new FocusNode());

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => getGender()),
          );
        

          setState(() => {genderPicked.text = gender});
        },
          onChanged:
          (String text) {
            
            genderPicked.text = gender;
          },
        validator: (String value) {
          if (value.isEmpty) {
            return 'Gender is Required';
          }

          return null;
        },
        
      ),
    );
  }

  Widget _buildDob() {
    return Container(
      width: getProportionateScreenWidth(142),
      child: TextFormField(
        controller: datePicked,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: getProportionateScreenWidth(10)),
            labelText: 'Date of Birth',
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
        //maxLength: 8,
        // controller: dateCtl,
        onTap: () async {
          FocusScope.of(context).requestFocus(new FocusNode());

          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(2010, 3, 5),
              maxTime: DateTime(2030, 6, 7),
              theme: DatePickerTheme(
                  headerColor: Color.fromRGBO(250, 250, 250, 1),
                  backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  itemStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
              onChanged: (date) {}, onConfirm: (date) {
            print(date.day);
            print(date.month);
            print(date.year);
            tempdate = date.day.toString() +
                '/' +
                date.month.toString() +
                '/' +
                date.year.toString();
          }, currentTime: DateTime.now(), locale: LocaleType.en);
          await setState(() => {datePicked.text = tempdate});
        },
        validator: (String value) {
          if (value.isEmpty) {
            return 'Date of Birth is Required';
          }

          return null;
        },
      ),
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
              top: getProportionateScreenHeight(310)),
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
                      child: Text('Enter Details',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SF Pro Display',
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(30)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildfirstName(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      _buildlastName(),
                      // SizedBox(height: getProportionateScreenHeight(30)),
                      //_buildmobile(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Row(
                          //mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            _buildgender(),
                            SizedBox(width: getProportionateScreenWidth(31)),
                            _buildDob(),
                          ]),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: getProportionateScreenWidth(155),
                            child: CheckboxListTile(
                              selectedTileColor:
                                  Color.fromRGBO(246, 246, 246, 1),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text('Myself'),
                              value: _checkbox1,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox1 = !_checkbox1;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(10)),
                            width: getProportionateScreenWidth(180),
                            child: CheckboxListTile(
                              selectedTileColor:
                                  Color.fromRGBO(246, 246, 246, 1),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                'Relative',
                                softWrap: true,
                              ),
                              value: !_checkbox1,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox1 = !_checkbox1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
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
                                    return EnterMobile();
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
                                          Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                          ),
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
      // bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

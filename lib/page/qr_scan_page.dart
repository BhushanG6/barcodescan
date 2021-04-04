import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../size_config.dart';
import '../enter_details.dart';
import '../main.dart';

class QRScanPage extends StatefulWidget {
  @override
  
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';

  @override
  
  Widget build(BuildContext context) {
     SizeConfig().init(context);

    return Scaffold(
    
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Scan Result',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(206)),
                InkWell(
                  onTap: () { 
                        showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return FormScreen();
        });

                   // Navigator.of(context).push(
              //MaterialPageRoute(
               // builder: (context) {
               // 
                 // scanQRCode();
                //},
              //),
            //);
                   
                  },
                  child: Container(
                    //padding:EdgeInsets.only(top: getProportionateScreenHeight(206)),
                    height: getProportionateScreenHeight(246),
                    width: getProportionateScreenHeight(246),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormScreen(),
        ),
      );
      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}

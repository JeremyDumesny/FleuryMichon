import 'package:fleury_michon/states/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class QRScanPage extends StatefulWidget {
  QRScanPage({Key key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Scan du QR Code"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Resultat du scan : ' +
                    Provider.of<GlobalState>(context, listen: false)
                        .fleuryBarCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 72),
              RaisedButton(
                child: Text(
                  "Commencer le scan",
                  style: TextStyle(fontSize: 24),
                ),
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                textColor: Colors.white,
                onPressed: () => scanQRCode(),
              ),
              SizedBox(
                height: 10,
              ),
              Provider.of<GlobalState>(context, listen: false).hasScanned
                  ? RaisedButton(
                      onPressed: () => (Navigator.pop(context)),
                      child: Text(
                        "Accédez aux recettes",
                        style: TextStyle(fontSize: 24),
                      ),
                      shape: StadiumBorder(),
                      color: Theme.of(context).primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      textColor: Colors.white,
                    )
                  : SizedBox()
            ],
          ),
        ),
      );

  Future<void> scanQRCode() async {
    try {
      final barCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Annuler', true, ScanMode.BARCODE);

      if (!mounted) return;

      setState(() {
        Provider.of<GlobalState>(context, listen: false).fleuryBarCode =
            Provider.of<GlobalState>(context, listen: false)
                .returnBarcodeValue(barCode);
      });
    } on PlatformException {
      Provider.of<GlobalState>(context, listen: false).fleuryBarCode =
          "Erreur lors de la récupération de la version de la plateforme";
    }
  }
}

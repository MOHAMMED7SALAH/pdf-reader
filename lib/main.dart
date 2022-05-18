import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_viewer_example/api/pdf_api.dart';
import 'package:pdf_viewer_example/page/pdf_viewer_page.dart';
import 'package:pdf_viewer_example/widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFFF6A064),
                Color(0xFFF24223),
                Color(0xFFEA7A6C),
                Color(0xFF27823),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.3, 0.6, 1.0],
              tileMode: TileMode.clamp),
        ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    
                    child: Lottie.asset(
                    'assets/pdf.json',
                  height: 200.0,
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
                  ),
                   SizedBox(height: size.height * .09),
                  ButtonWidget(
                    height: size.height * .09,
                    width: size.width * .8,
                    text: 'Open PDF',
                    onClicked: () async {
                      final file = await PDFApi.pickFile();

                      if (file == null) return;
                      openPDF(context, file);
                    },
                  ),
                  const SizedBox(height: 16),
                  // ButtonWidget(
                  //   text: 'Network PDF',
                  //   onClicked: () async {
                  //     final url =
                  //         'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                  //     final file = await PDFApi.loadNetwork(url);
                  //     openPDF(context, file);
                  //   },
                  // ),
                  const SizedBox(height: 16),
                  // ButtonWidget(
                  //   text: 'Firebase PDF',
                  //   onClicked: () async {
                  //     final url = 'sample.pdf';
                  //     final file = await PDFApi.loadFirebase(url);

                  //     if (file == null) return;
                  //     openPDF(context, file);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}

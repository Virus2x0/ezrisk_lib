import 'package:ezrisk/pages/widget/download_dialog.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:velocity_x/velocity_x.dart';

class PDFPage extends StatefulWidget {
  String PDFtitle;
  String PDFlink;

  PDFPage({required this.PDFtitle, required this.PDFlink});

  @override

  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "${widget.PDFtitle}".text.make(),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const DownloadingDialog(),
            );
          },
          tooltip: 'Download File',
          child: const Icon(Icons.download),
        ),
<<<<<<< HEAD
        body: Column(
          children: [
            SfPdfViewer.network(
                'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'),
          ],
        ));
=======
        body: SfPdfViewer.network(
            "${widget.PDFlink}"));
>>>>>>> d29de105f52af8242dcf680ed2a5f4916214e230
  }
}

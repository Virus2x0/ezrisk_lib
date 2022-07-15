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
              builder: (context) => const DownloadingDialog(url:widget.PDFlink),
            );
          },
          tooltip: 'Download File',
          child: const Icon(Icons.download),
        ),
        body: SfPdfViewer.network("${widget.PDFlink}"));
  }
}

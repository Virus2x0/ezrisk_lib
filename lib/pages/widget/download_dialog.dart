import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:external_path/external_path.dart';

class DownloadingDialog extends StatefulWidget {
  const DownloadingDialog({Key? key}) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  late bool permissionGranted;
  double progress = 0.0;
  var downloadingprogress;

  void startDownloading() async {
     const String url =
        'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

     String fileName =  url.substring(url.lastIndexOf("/") + 1);
     print(fileName);

    String path = await _getFilePath(fileName);

    try {
      Response response = await dio.download(
        url,
        path,
        onReceiveProgress: (recivedBytes, totalBytes) {
          setState(() {
            progress =  recivedBytes / totalBytes;
            
          });

          print(progress);
        },
         options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
            ),
      );
      print(response.headers);
      // File file = File(path);
      // var raf = file.openSync(mode: FileMode.write);
      // // response.data is List<int> type
      // raf.writeFromSync(response.data);
      // await raf.close();
    } catch (e) {
      print(e);
    }
  }
  
  
  Future<String> _getFilePath(String filename) async {
    final dir = await  ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    return "${dir}/$filename";
  }

  Future<void> _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getStoragePermission();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
                maintainSize: progress == 1.0 ? false : true,
                maintainAnimation: true,
                maintainState: true,
                visible: progress != 1.0 ? true : false,
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: CircularProgressIndicator())),
          const SizedBox(
            height: 20,
          ),
          Text(
            progress == 1.0 ? "Download completed" : "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          
        ],
      ),
      actions: [TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(progress == 1.0 ? 'done' : 'cancel'),
            ),],
    );
  }
}

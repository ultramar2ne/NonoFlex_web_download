import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '노노유통',
      home: MyHomePage(title: '노노유통 다운로드 페이지'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final downloadUrl = 'https://dl.dropboxusercontent.com/s/wkmmjmappm19hkx/nonoflex_v1.0.1.apk';
  final releaseNoteUrl = 'https://nonoflex.notion.site/c3e425b946464025ad59a5652136c0f6';
  final versionInfo = 'v1.0.1';

  @override
  void initState() {
    super.initState();
  }

  void downloadAPKFile() {
    launchUrl(Uri.parse(downloadUrl));
  }

  void openReleaseNotePage() {
    launchUrl(Uri.parse(releaseNoteUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0043AF),
      body: Center(
        widthFactor: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('assets/Icon-nono.png'),
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 30),
                Text(
                  '앱 다운로드 페이지',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  width: 280,
                  height: 280,
                  child: QrImage(data: downloadUrl)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '최신 버전 : $versionInfo',
                    style: const TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () => openReleaseNotePage(),
                    child: const Text(
                      '변경 사항 확인하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
                minWidth: 300,
                height: 80,
                onPressed: () => downloadAPKFile(),
                highlightElevation: 0,
                elevation: 0,
                focusElevation: 0,
                hoverElevation: 0,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff0043AF)),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                color: Colors.white,
                highlightColor: const Color(0xff0043AF),
                disabledColor: const Color(0xffF2F9FF),
                disabledElevation: 0,
                hoverColor: const Color(0xffF2F9FF),
                child: const Text(
                  '다운로드',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
          ],
        ),
      ),
    );
  }
}

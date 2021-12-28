import 'package:flutter/material.dart';
import '../screens/add_phone_number_screen.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List items = [
      'English',
      'Hindi',
      'Tamil',
      'Gujarati',
    ];

    String? optionValue = items[0];

    return Scaffold(
      body: Container(
        height: deviceSize.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              Icons.insert_photo_outlined,
              size: 55,
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            const Text(
              'Please select your Language',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.025,
            ),
            const Text(
              'You can change the language \nat any time.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: deviceSize.height * 0.025,
            ),
            Container(
              width: deviceSize.width * 0.7,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: optionValue,
                  iconSize: 36,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  items: items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      optionValue = value.toString();
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Container(
              width: deviceSize.width * 0.7,
              height: 50,
              child: RaisedButton(
                color: Colors.indigo.shade800,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AddPhoneNumberScreen.routeName);
                },
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: CustomPaint(
                      size: Size(
                        deviceSize.width,
                        deviceSize.height * 0.25,
                      ),
                      painter: CurvedPainter(isFirst: true),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: CustomPaint(
                      size: Size(
                        deviceSize.width,
                        deviceSize.height * 0.25,
                      ),
                      painter: CurvedPainter(isFirst: false),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  final bool isFirst;

  CurvedPainter({required this.isFirst});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = isFirst ? Colors.blue.shade300 : Colors.indigo.shade600
      ..strokeWidth = 15;

    var path = Path();

    if (isFirst) {
      path.moveTo(0, size.height * 0.6);
      path.quadraticBezierTo(size.width * 0.3, size.height * 0.3,
          size.width * 0.5, size.height * 0.6);
      path.quadraticBezierTo(size.width * 0.7, size.height * 0.9,
          size.width * 1.0, size.height * 0.6);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);

      canvas.drawPath(path, paint);
    } else {
      path.moveTo(0, size.height * 0.5);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.9,
          size.width * 0.5, size.height * 0.7);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.45,
          size.width * 1.0, size.height * 0.6);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

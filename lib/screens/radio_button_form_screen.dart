import 'package:flutter/material.dart';

class RadioButtonFormScreen extends StatefulWidget {
  const RadioButtonFormScreen({Key? key}) : super(key: key);
  static const routeName = '/select-profile';

  @override
  State<RadioButtonFormScreen> createState() => _RadioButtonFormScreenState();
}

class _RadioButtonFormScreenState extends State<RadioButtonFormScreen> {
  String _value = '';

  Widget _getCardOption(String title, Icon optionIcon, double deviceWidth) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Radio(
            value: title,
            groupValue: _value,
            onChanged: (String? value) {
              setState(() {
                _value = value!;
              });
            },
          ),
          title: Row(
            children: [
              optionIcon,
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              SizedBox(
                // width: 70,
                width: deviceWidth * 0.025,
              ),
              SizedBox(
                // width: 200,
                width: deviceWidth * 0.6,
                child: const Text(
                  'Lorem Ipsum is simply dummy text of the printing industry.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please select your profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.025,
            ),
            _getCardOption(
              'Shipper',
              const Icon(
                Icons.store,
                size: 50,
              ),
              deviceSize.width,
            ),
            _getCardOption(
              'Transporter',
              const Icon(
                Icons.drive_eta_outlined,
                size: 50,
              ),
              deviceSize.width,
            ),
          ],
        ),
      ),
    );
  }
}

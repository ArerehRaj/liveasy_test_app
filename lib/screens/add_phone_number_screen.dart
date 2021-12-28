import 'package:flutter/material.dart';

class AddPhoneNumberScreen extends StatelessWidget {
  static const routeName = '/add-phone';
  AddPhoneNumberScreen({Key? key}) : super(key: key);

  final _mobilePhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.clear_outlined,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please enter your mobile number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.025,
              ),
              const Text(
                'You will recieve a 6 digit code to verify next.',
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
                height: 50,
                width: deviceSize.width * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/india.png',
                      fit: BoxFit.cover,
                      height: 28,
                    ),
                    const Text(
                      ' +91\t- ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _mobilePhoneController,
                        decoration: const InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.025,
              ),
              Container(
                width: deviceSize.width * 0.7,
                height: 50,
                child: RaisedButton(
                  color: Colors.indigo.shade800,
                  onPressed: () {},
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

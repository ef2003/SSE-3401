import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sse3401___lab5/factoryDashboard.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool check = false;
  int index = 1;
  String otp = '';

  TextEditingController phNumber = TextEditingController();
  TextEditingController otpNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/upm.jpg',
                  width: 200,
                  height: 120,
                ),
                const Text(' Welcome !',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: index == 1
                      ? _buildAccountActivation()
                      : _buildOtpConfirmation(),
                ),
                const SizedBox(height: 50),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountActivation() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(84, 231, 125, 125),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                        'Enter your mobile number to activate your account.',
                        style: TextStyle(fontSize: 20))),
                Icon(
                  Icons.info,
                  size: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Image.asset(
                  'images/flag.png',
                  width: 40,
                  height: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('+60', style: TextStyle(fontSize: 17)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                        controller: phNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            )))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Checkbox(
                  value: check,
                  onChanged: (bool? value) {
                    setState(() {
                      check = !check;
                    });
                  }),
              const Text('I agree to the terms & conditions',
                  style: TextStyle(fontSize: 17))
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: const Text('Get Activation Code',
                      style: TextStyle(fontSize: 20)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOtpConfirmation() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ]),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                        'Enter the activation code you received via SMS.',
                        style: TextStyle(fontSize: 20))),
                Icon(
                  Icons.info,
                  size: 25,
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: otpNumber,
                        maxLength: 6,
                        onChanged: (value) {
                          setState(() {
                            otp = value.substring(0, value.length.clamp(0, 6));
                          });
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'OTP',
                            counterText: '${otp.length}/6',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            )))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Didn\'t receive?',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
              Text('  Tap here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      decoration: TextDecoration.underline))
            ]),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const factoryDashboard(),
                      ),
                    );
                  },
                  child: Text('Activate', style: TextStyle(fontSize: 20)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Text('Disclaimer | Privary Statement',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
              textAlign: TextAlign.center),
          SizedBox(
            height: 15,
          ),
          Text(
            'Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn.Bhd.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}

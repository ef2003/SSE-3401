import 'package:flutter/material.dart';
import 'package:sse3401___lab5/factoryDashboard.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: invitationPage()));
}

class invitationPage extends StatefulWidget {
  const invitationPage({Key? key}) : super(key: key);

  @override
  _invitationPageState createState() => _invitationPageState();
}

class _invitationPageState extends State<invitationPage> {
  int factoryName = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(178, 251, 247, 247),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Factory $factoryName',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: Center(
            child: Column(
          children: [
            Text('Invitation',
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
            Text('Invite users', style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Owner\'s Name', style: TextStyle(fontSize: 22)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 35),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Type here'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Owner\'s Phone Number', style: TextStyle(fontSize: 22)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image.asset(
                  'images/flag.png',
                  width: 40,
                  height: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('+60', style: TextStyle(fontSize: 18)),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: ('Enter your phone num...'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.black),
                            )))),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => const factoryDashboard(),
                    ),
                  );
                },
                child: Text('submit', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

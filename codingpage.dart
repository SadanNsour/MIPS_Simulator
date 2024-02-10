import 'package:flutter/material.dart';
import 'main.dart';
import 'options.dart';

class CodingPage extends StatelessWidget {
  const CodingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7210FF),
          title: Text(
            "Code Screen",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: CodingPageGo(),
        ),
      ),
    );
  }
}

class CodingPageGo extends StatefulWidget {
  const CodingPageGo({super.key});

  @override
  State<CodingPageGo> createState() => _CodingPageGoState();
}

class _CodingPageGoState extends State<CodingPageGo> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20.0,
      ),
      Expanded(
        flex: 1,
        child: Text(
          'Your code must be written in this format:\n\nINSTR1 R1,R2,R3\nINSTR2 R1,R2,R3\nINSTR3 R1,R2,R3',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Expanded(
        flex: 1,
        child: TextFormField(
          controller: _textController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            labelText: 'Please Enter Your Code Here',
            labelStyle: TextStyle(fontSize: 14.0),
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            fillColor: Colors.grey[200],
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => _textController.clear(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              usrePost = _textController.text;
              bool checkResult = checkSyntax(usrePost);
              if (!checkResult) {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Error'),
                    content: Text(
                        'Your code does not match the standard format , press \'Try again\' to return to the text editor page!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: const Text('Try again!'),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                runApp(SelectOptions());
              }
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF7210FF),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            textStyle: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
            elevation: 4.0,
            shadowColor: Color(0xFF7210FF),
          ),
          child: Text(
            'Start Running',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    ]);
  }
}

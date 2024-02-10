import 'package:flutter/material.dart';
import 'main.dart';
import 'codingpage.dart';

class RegValues extends StatefulWidget {
  const RegValues({Key? key}) : super(key: key);

  @override
  State<RegValues> createState() => _RegValuesState();
}

class _RegValuesState extends State<RegValues> {
  final _textController0 = TextEditingController();
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  final _textController4 = TextEditingController();
  final _textController5 = TextEditingController();
  final _textController6 = TextEditingController();
  final _textController7 = TextEditingController();
  String usrePost = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7210FF),
        title: Text(
          "Registers Value",
          style: TextStyle(color: Colors.white), 
        ),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  'Enter Registers value, default value is 0',
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16.0, 
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController0.text.toString();
                    t[0] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController0,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t0 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController0.clear(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController1.text.toString();
                    t[1] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController1,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t1 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController1.clear(),
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
                    keyboardType: TextInputType.number,

                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController2.text.toString();
                    t[2] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController2,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t2 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController2.clear(),
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
                    keyboardType: TextInputType.number,

                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController3.text.toString();
                    t[3] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController3,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t3 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController3.clear(),
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
                    keyboardType: TextInputType.number,

                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController4.text.toString();
                    t[4] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController4,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t4 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController4.clear(),
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
                    keyboardType: TextInputType.number,

                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController5.text.toString();
                    t[5] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController5,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t5 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController5.clear(),
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
                    keyboardType: TextInputType.number,

                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController6.text.toString();
                    t[6] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController6,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t6 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController6.clear(),
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
                    keyboardType: TextInputType.number,

                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                    String temp = _textController7.text.toString();
                    t[7] = int.parse(temp);
                  },
                  child: TextFormField(
                    controller: _textController7,
                    decoration: InputDecoration(
                      labelText: 'Enter \$t7 Value',
                      labelStyle: TextStyle(fontSize: 14.0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _textController7.clear(),
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
                    keyboardType: TextInputType.number,


                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      List<TextEditingController> controllers = [
                        _textController0,
                        _textController1,
                        _textController2,
                        _textController3,
                        _textController4,
                        _textController5,
                        _textController6,
                        _textController7,
                      ];

                      for (var controller in controllers) {
                        if (controller.text.isEmpty) {
                          controller.text = '0'; 
                        }
                      }
                      //List<int> t = controllers.map((c) => int.parse(c.text)).toList();
                      String temp = _textController0.text.toString();
                      t[0] = int.parse(temp);
                      temp = _textController1.text.toString();
                      t[1] = int.parse(temp);
                      temp = _textController2.text.toString();
                      t[2] = int.parse(temp);
                      temp = _textController3.text.toString();
                      t[3] = int.parse(temp);
                      temp = _textController4.text.toString();
                      t[4] = int.parse(temp);
                      temp = _textController5.text.toString();
                      t[5] = int.parse(temp);
                      temp = _textController6.text.toString();
                      t[6] = int.parse(temp);
                      temp = _textController7.text.toString();
                      t[7] = int.parse(temp);
                      setState(() {
                        runApp(CodingPage());
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
                    child: Text('Start Coding',
                      style: TextStyle(
                        fontSize: 16.0, 
                        color: Colors.white, 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

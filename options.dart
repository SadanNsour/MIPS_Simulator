import 'package:flutter/material.dart';
import 'finalresult.dart';
import 'main.dart';
import 'stepbystep.dart';
class SelectOptions extends StatelessWidget {
  const SelectOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7210FF),
          title: Text(
            "Select Option",
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
          child: SelectOptionGo(),
        ),
      ),
    );
  }
}

class SelectOptionGo extends StatefulWidget {
  const SelectOptionGo({super.key});

  @override
  State<SelectOptionGo> createState() => _SelectOptionGoState();
}

class _SelectOptionGoState extends State<SelectOptionGo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Select one of the options to continue:',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                'Final Result Run',
                style: TextStyle(color: Colors.white,
                  fontSize: 16.0, 
                ),
              ),
              onPressed: () {
                bool v = false;
                v=startFinalResult();
                if(v){
      
                }
                setState(() {
                  runApp(SimulatorScreen1());
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
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              child: Text(
                'Step-By-Step Run',
                style: TextStyle(color: Colors.white,
                  fontSize: 16.0, 
                ),
              ),
              onPressed: () {
                setState(() {
                  runApp(SimulatorScreen2());
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
            ),
          ),
        ],
      ),
    );
  }
}

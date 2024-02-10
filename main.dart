import 'package:flutter/material.dart';
import 'instruction.dart';
import 'registers.dart';
import 'package:google_fonts/google_fonts.dart';

List<int> t = [0, 0, 0, 0, 0, 0, 0, 0, 0];
List<Instruction> L = [];

String usrePost = '';
void main() {
  runApp(SimulatorApp());
}

class SimulatorApp extends StatelessWidget {
  SimulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF7210FF), 
        textTheme: GoogleFonts.urbanistTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF7210FF),
          title: const Text('MIPS Simulator App',
            style: TextStyle(
              color: Colors.white, 
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: SimulatorPage(),
        ),
      ),
    );
  }
}


class SimulatorPage extends StatefulWidget {
  const SimulatorPage({super.key});

  @override
  State<SimulatorPage> createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Image.asset('images/image-1.png'),
              SizedBox(height: 40.0),
              Text(
                'Welcome To Our App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Step into the world of CPUs and experience real-time instruction execution. Dive in and discover the inner workings of a computer processor.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegValues()),
            );
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
            'Get Started',
            style: TextStyle(
              fontSize: 16.0, 
              color: Colors.white, 
            ),
          ),
        ),

      ],
    );
  }
}

bool checkSyntax(String textCode) {
  if (textCode == '') return false;
  for (int i = 0; i < textCode.length; i += 16) {
    String instr = '';
    int f1, f2, f3;
    if (i == textCode.length) break;
    String instruction = textCode.substring(i, i + 3);
    String cInstruction = textCode.substring(i, i + 15);
    instr = instruction;
    if (instruction != 'ADD' &&
        instruction != 'AND' &&
        instruction != 'SLT' &&
        instruction != 'SLL' &&
        instruction != 'SUB') {
      return false;
    }
    if (textCode[i + 3] != ' ') {
      return false;
    }
    String R1 = textCode.substring(i + 4, i + 7);
    f1 = int.parse(textCode.substring(i + 6, i + 7));
    if (R1 != '\$t0' &&
        R1 != '\$t1' &&
        R1 != '\$t2' &&
        R1 != '\$t3' &&
        R1 != '\$t4' &&
        R1 != '\$t5' &&
        R1 != '\$t6' &&
        R1 != '\$t7') {
      return false;
    }
    if (textCode[i + 7] != ',') {
      return false;
    }
    String R2 = textCode.substring(i + 8, i + 11);
    f2 = int.parse(textCode.substring(i + 10, i + 11));
    if (R2 != '\$t0' &&
        R2 != '\$t1' &&
        R2 != '\$t2' &&
        R2 != '\$t3' &&
        R2 != '\$t4' &&
        R2 != '\$t5' &&
        R2 != '\$t6' &&
        R2 != '\$t7') {
      return false;
    }
    if (textCode[i + 11] != ',') {
      return false;
    }
    String R3 = textCode.substring(i + 12, i + 15);
    f3 = int.parse(textCode.substring(i + 14, i + 15));
    if (instruction == 'SLL') {
      if (!(int.parse(textCode.substring(i + 12, i + 13)) >= 0 &&
          int.parse(textCode.substring(i + 12, i + 13)) <= 9))
        return false;
      else
        f3 = int.parse(R3);
    }
    if (R3 != '\$t0' &&
        R3 != '\$t1' &&
        R3 != '\$t2' &&
        R3 != '\$t3' &&
        R3 != '\$t4' &&
        R3 != '\$t5' &&
        R3 != '\$t6' &&
        R3 != '\$t7') {
      if (instruction != 'SLL') return false;
    }
    Instruction I = new Instruction(cInstruction,instr, f1, f2, f3);
    L.add(I);
  }
  return true;
}

bool startFinalResult() {
  bool v = false;
  int i = 0;
  for (i = 0; i < L.length; i++) {
    if (L[i].instr == 'ADD') {
      L[i].addInstruction();
    }
    if (L[i].instr == 'SUB') {
      v = L[i].subInstruction();
    }
    if (L[i].instr == 'AND') {
      L[i].andInstruction();
    }
    if (L[i].instr == 'SLT') {
      L[i].sltInstruction();
    }
    if (L[i].instr == 'SLL') {
      L[i].sllInstruction();
    }
  }
  return v;
}

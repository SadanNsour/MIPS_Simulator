import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

int nextCyc = 1;

class SimulatorScreen2 extends StatelessWidget {
  const SimulatorScreen2({super.key});

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
              title: Text(
                'Step by step',
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: IconThemeData(color: Colors.white),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              elevation: 0,
            ),
            body: const Padding(
              padding: EdgeInsets.all(20.0),
              child: SimulatorScreen2Go(),
            )));
  }
}

class SimulatorScreen2Go extends StatefulWidget {
  const SimulatorScreen2Go({super.key});

  @override
  State<SimulatorScreen2Go> createState() => _SimulatorScreen2GoState();
}

class _SimulatorScreen2GoState extends State<SimulatorScreen2Go> {
  int totalCycles = L.length + 4;
  String completedInstructions = '';
  int currentCycle = 0;

  Map<String, int> registers = {
    for (var i = 0; i < 8; i++) '\$t$i': t[i],
  };
  int currentOnFetch = 0;
  int currentOnDecode = -1;
  int currentOnExecute = -2;
  int currentOnMemory = -3;
  int currentOnWB = -4;

  Map<String, String> stages = {
    'Fetch': ' ',
    'Decode': ' ',
    'Execute': ' ',
    'Memory': ' ',
    'WriteBack': ' ',
  };

  void onNextCyclePressed() {
    setState(() {
      currentCycle++;

      if (currentCycle > totalCycles) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Program End'),
              content: const Text('The program has reached its end.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      if(currentCycle<=totalCycles){currentOnFetch++;
      currentOnDecode++;
      currentOnExecute++;
      currentOnMemory++;
      currentOnWB++;
      nextCyc = currentCycle + 1;

      if (currentOnWB > 0 && currentOnWB <= L.length) {
        completedInstructions += L[currentOnWB - 1].cInstr;
        completedInstructions += '\n';
      }

      if (currentOnFetch > 0 && currentOnFetch <= L.length)
        stages['Fetch'] = L[currentOnFetch - 1].instr;
      if (currentOnDecode > 0 && currentOnDecode <= L.length)
        stages['Decode'] = L[currentOnDecode - 1].instr;
      if (currentOnExecute > 0 && currentOnExecute <= L.length)
        stages['Execute'] = L[currentOnExecute - 1].instr;
      if (currentOnMemory > 0 && currentOnMemory <= L.length)
        stages['Memory'] = L[currentOnMemory - 1].instr;
      if (currentOnWB > 0 && currentOnWB <= L.length)
        stages['WriteBack'] = L[currentOnWB - 1].instr;

      if (currentCycle > totalCycles - 4) stages['Fetch'] = ' ';
      if (currentCycle > totalCycles - 3) stages['Decode'] = ' ';
      if (currentCycle > totalCycles - 2) stages['Execute'] = ' ';
      if (currentCycle > totalCycles - 1) stages['Memory'] = ' ';
      if (currentCycle > totalCycles) stages['WriteBack'] = ' ';
      if (currentOnWB > 0) {
        if (L[currentOnWB - 1].instr == 'ADD') {
          L[currentOnWB - 1].addInstruction();
        }
        if (L[currentOnWB - 1].instr == 'SUB') {
          L[currentOnWB - 1].subInstruction();
        }
        if (L[currentOnWB - 1].instr == 'AND') {
          L[currentOnWB - 1].andInstruction();
        }
        if (L[currentOnWB - 1].instr == 'SLT') {
          L[currentOnWB - 1].sltInstruction();
        }
        if (L[currentOnWB - 1].instr == 'SLL') {
          L[currentOnWB - 1].sllInstruction();
        }
      }
      for (var i = 0; i < 8; i++) {
        registers['\$t$i'] = t[i];
      }
    }}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Expanded(child: RegistersGrid(registers: registers)),
          Expanded(child: StagesList(stages: stages)),
          CycleInformation(
              totalCycles: totalCycles,
              completedInstructions: completedInstructions,
              currentCycle: currentCycle),
          NextCycleButton(onPressed: onNextCyclePressed),
        ],
      ),
    );
  }
}

class RegistersGrid extends StatelessWidget {
  final Map<String, int> registers;

  RegistersGrid({required this.registers});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: registers.length,
      itemBuilder: (context, index) {
        String key = registers.keys.elementAt(index);
        return Card(
          elevation: 4,
          child: Center(
            child: Text('$key: ${registers[key]}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}

class StagesList extends StatelessWidget {
  final Map<String, String> stages;

  StagesList({required this.stages});

  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount: stages.length,
      itemBuilder: (context, index) {
        String key = stages.keys.elementAt(index);
        return Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF7210FF),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              '$key: ${stages[key]}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CycleInformation extends StatelessWidget {
  final int totalCycles;
  final String completedInstructions;
  final int currentCycle;

  CycleInformation(
      {required this.totalCycles,
      required this.completedInstructions,
      required this.currentCycle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          InfoText(title: 'Total Cycles', value: totalCycles.toString()),
          InfoText(
              title: 'Completed Instructions',
              value: completedInstructions.toString()),
          InfoText(title: 'Current Cycle', value: currentCycle.toString()),
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String title;
  final String value;

  InfoText({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Text('$title: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}

class NextCycleButton extends StatelessWidget {
  final VoidCallback onPressed;

  NextCycleButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Next Cycle($nextCyc)',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF7210FF),
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'main.dart';
class SimulatorScreen1 extends StatelessWidget {
  const SimulatorScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xFF7210FF),
              title: Text(
                'Final Result',
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
              child: SimulatorScreen1Go(),
            )
        )
    );
  }
}

class SimulatorScreen1Go extends StatefulWidget {
  const SimulatorScreen1Go({super.key});

  @override
  State<SimulatorScreen1Go> createState() => _SimulatorScreen1GoState();
}

class _SimulatorScreen1GoState extends State<SimulatorScreen1Go> {
  int totalCycles =L.length+4;
  Map<String, int> registers = {
    for (var i = 0; i < 8; i++) '\$t$i': t[i],
  };

  Map<String, String> stages = {
    'Fetch': 'add',
    'Decode': 'sll',
    'Execute': 'addi',
    'Memory': 'slt',
    'WriteBack': 'sll',
  };

  /*void onNextCyclePressed() {
    setState(() {
      totalCycles++;
      currentCycle++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Expanded(child: RegistersGrid(registers: registers)),
          CycleInformation(
            totalCycles: totalCycles,
          )],
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
        crossAxisCount: 3,
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
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
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

  CycleInformation(
      {required this.totalCycles
      });

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
          /*InfoText(
              title: 'Completed Instructions',
              value: completedInstructions.toString()),
          InfoText(title: 'Current Cycle', value: currentCycle.toString()),*/
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
        child: Text('Next Cycle'),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF7210FF),
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

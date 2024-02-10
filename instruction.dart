import 'main.dart';

class Instruction {
  String instr = '', cInstr = '';
  int destF = 0, src1F = 0, src2F = 0;
  Instruction(String c, String s, int n1, int n2, int n3) {
    cInstr = c;
    instr = s;
    destF = n1;
    src1F = n2;
    src2F = n3;
  }
  void addInstruction() {
    t[destF] = t[src1F] + t[src2F];
  }

  void andInstruction() {
    t[destF] = t[src1F] & t[src2F];
  }

  void sltInstruction() {
    if (t[src2F] < t[src1F]) {
      t[destF] = 1;
    } else {
      t[destF] = 0;
    }
  }

  bool subInstruction() {
    bool v = false;
    if (t[src1F] < t[src2F]) {
      v = true;
      t[destF] = 8589934591;
    } else {
      t[destF] = t[src1F] - t[src2F];
    }
    return v;
  }

  void sllInstruction() {
    t[destF] = t[src1F] << src2F;
  }
}

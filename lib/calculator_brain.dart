import 'dart:math';

/// In Swift Enums are very powerful since they could take associated values.
/// I decided to implement this same functionality in Dart using a class and
/// named constructors.
/// 
/// Note: the only problem with this implementation is that you can't use
/// a switch/case statement.
class Operation {
  bool constant;
  bool unaryOperation;
  num value;
  Function func;

  Operation.constant(num value) {
    this.value = value;
    constant = true;
    unaryOperation = false;
  }

  Operation.unaryOperation(Function func) {
    this.func = func;
    constant = false;
    unaryOperation = true;
  }
}

num changeSign(num operand) => -operand;

class CalculatorBrain {
  num _accumulator;
  get result => _accumulator;

  var operations = <String, Operation>{
    'π':    Operation.constant(pi),                // pi
    'e':    Operation.constant(e),                // e
    'cos':  Operation.unaryOperation(cos),        // cos
    '√':    Operation.unaryOperation(sqrt),        // sqrt
    '±':    Operation.unaryOperation(changeSign),  // change sign
  };

  void performOperation(String symbol) {
    if(operations.containsKey(symbol)) {
      Operation operation = operations[symbol];
      if(operation.constant) {
        _accumulator = operation.value;
      } 
      else if(operation.unaryOperation) {
        _accumulator = _accumulator != null ? operation.func(_accumulator) : _accumulator;
      }
    }
  }

  void setOperand(num operand) => _accumulator = operand;
}
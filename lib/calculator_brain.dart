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
  bool binaryOperation;
  bool equals;
  num value;
  Function func;

  Operation.constant(num value) {
    this.value = value;
    constant = true;
    unaryOperation = false;
    binaryOperation = false;
    equals = false;
  }

  Operation.unaryOperation(Function func) {
    this.func = func;
    constant = false;
    unaryOperation = true;
    binaryOperation = false;
    equals = false;
  }

  Operation.binaryOperation(Function func) {
    this.func = func;
    constant = false;
    unaryOperation = false;
    binaryOperation = true;
    equals = false;
  }

  Operation.equals() {
    constant = false;
    unaryOperation = false;
    binaryOperation = false;
    equals = true;
  }
}

class PendingBinaryOperation {
  Function function;
  double firstOperand;

  PendingBinaryOperation({ this.function, this.firstOperand });

  num perform(num secondOperand) {
    return function(firstOperand, secondOperand);
  }
}

// TODO: Make AC, %, . functional.
class CalculatorBrain {
  num _accumulator;
  get result => _accumulator;
  PendingBinaryOperation _pendingBinaryOperation;

  void _performPendingBinaryOperation() {
    if( _pendingBinaryOperation != null && _accumulator != null) {
      _accumulator = _pendingBinaryOperation.perform(_accumulator);
      _pendingBinaryOperation = null;
    }
  }

  var operations = <String, Operation>{
    'π':    Operation.constant(pi),
    'e':    Operation.constant(e),
    'cos':  Operation.unaryOperation(cos),
    '√':    Operation.unaryOperation(sqrt),
    '±':    Operation.unaryOperation((op) => -op),
    '×':    Operation.binaryOperation((op1, op2) => op1 * op2),
    '÷':    Operation.binaryOperation((op1, op2) => op1 / op2),
    '−':    Operation.binaryOperation((op1, op2) => op1 - op2),
    '+':    Operation.binaryOperation((op1, op2) => op1 + op2),
    '=':    Operation.equals(),
  };

  void performOperation(String symbol) {
    print('symbol $symbol');
    if(!operations.containsKey(symbol)) { 
      return; 
    }

    Operation operation = operations[symbol];
    if(operation.constant) {
      _accumulator = operation.value;
    } 
    else if(operation.unaryOperation) {
      if(_accumulator != null) {
        _accumulator = operation.func(_accumulator);
      }
    }
    else if(operation.binaryOperation) {
      if(_accumulator != null) {
        _pendingBinaryOperation = PendingBinaryOperation(function: operation.func, firstOperand: _accumulator);
        _accumulator = null;
      }
    }
    else if(operation.equals) {
      _performPendingBinaryOperation();
    }
  }

  void setOperand(num operand) => _accumulator = operand;
}
class TuringVM_OLD{

  var numberSteps: Int
  let ttuplesArray: [TTuple]
  
  var instructions = [String: TTuple]()
 //you need some properties here. *Recall that we are storing our rules in a Dictionary.

 init(ttuplesArray: [TTuple]){
   self.ttuplesArray = ttuplesArray
   self.numberSteps = 0
   for ttuple in ttuplesArray{
     instructions[ttuple.getKey()] = ttuple
   }
 }

//  func tupleReport()->String{

//  }

 func nakedTupleReport() -> String{
  var output: String = "cs ic ns oc di \n"
  for tuple in ttuplesArray{
    output += tuple.nakedTuple()
    output += "\n"
    }
  return output
 }

//  func tapeAsString()->String{
//    return 
//  }

func runTuring(initialTape: String, initialState: Int, initialHead: Int) -> (numberSteps: Int, finalTape: String, trace: [String]){
  var numberSteps: Int = 0

  var tape = Array(initialTape)

  let tape_length = tape.count

  var trace: [String] = []
  var i = initialHead
  var state = initialState

  var inputChar = tape[i]
  var ttuple_unwrapped: TTuple? = instructions["\(state) \(inputChar)"]

  if ttuple_unwrapped != nil{
    var ttuple: TTuple = ttuple_unwrapped!
    tape[i] = ttuple.outputChar
    state = ttuple.currentState
    i += 1
    inputChar = tape[i]
    numberSteps += 1

    let tape_trace = String(tape[..<i]) + "[" + String(tape[i]) + "]" + String(tape[i+1..<tape_length])
    trace.append("\(numberSteps) \(ttuple) \(tape_trace) ")
    ttuple.currentState = ttuple.newState
    print(ttuple.currentState)
  }else{
    return (numberSteps: numberSteps, finalTape: String(tape), trace: trace)
  }

  while inputChar != "_" {
    var ttuple_unwrapped: TTuple? = instructions["\(state) \(inputChar)"]
  
    if ttuple_unwrapped != nil{
      var ttuple: TTuple = ttuple_unwrapped!
      tape[i] = ttuple.outputChar
      state = ttuple.currentState
      i += 1
      inputChar = tape[i]
      numberSteps += 1

      let tape_trace = String(tape[..<i]) + "[" + String(tape[i]) + "]" + String(tape[i+1..<tape_length])
      trace.append("\(numberSteps) \(ttuple) \(tape_trace)")
      ttuple.currentState = ttuple.newState
    }else{
      return (numberSteps: numberSteps, finalTape: String(tape), trace: trace)
    }
  }
  return (numberSteps: numberSteps, finalTape: String(tape), trace: trace)
 }
}  
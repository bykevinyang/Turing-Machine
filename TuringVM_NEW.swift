class TuringVM_NEW{

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

 func tupleReport()->String{
  var output: String = ""
  for tuple in ttuplesArray{
    output += tuple.description
    output += "\n"
    }
  return output
 }

 func nakedTupleReport() -> String{
  var output: String = "cs ic ns oc di \n"
  for tuple in ttuplesArray{
    output += tuple.nakedTuple()
    output += "\n"
    }
  return output
 }

 func tapeAsString(_ tape: [Character])-> String{
  return String(tape)
 }

func runTuring(initialTape: String, initialState: Int, initialHead: Int) -> (numberSteps: Int, finalTape: String, trace: [String]){
  var numberSteps: Int = 0

  var tape = Array(initialTape)
  
  let tape_length = tape.count

  var trace: [String] = []
  var i = initialHead
  var state = initialState

  var inputChar = tape[i]

  var first_time: Bool = true

  while inputChar != "_" || first_time == true{
  let ttuple_unwrapped: TTuple? = instructions["\(state) \(inputChar)"]

  if ttuple_unwrapped != nil{
    let ins_ttuple: TTuple = ttuple_unwrapped!
    tape[i] = ins_ttuple.outputChar             // Write char to tape

    if ins_ttuple.direction == .right{
      i += 1
      }
    else{
      i += -1
    }
    inputChar = tape[i]
    numberSteps += 1

    let tape_trace = String(tape[..<i]) + "[" + String(tape[i]) + "]" + String(tape[i+1..<tape_length])
    trace.append("\(numberSteps): {\(ins_ttuple)} \(tape_trace) ")
    state = ins_ttuple.newState
    }
  else{ // Halting here
    return (numberSteps: numberSteps, finalTape: tapeAsString(tape), trace: trace)
    }

  first_time = false
  }
  return (numberSteps: numberSteps, finalTape: tapeAsString(tape), trace: trace)
}
}

// What is TupleReport? Do I have to use it?
// What is tapeAsString? Do I have to use it?
// Do we have more example problems to test my code out?
// Are we supposed to provide you with our answers for the excersises
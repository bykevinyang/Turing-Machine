func example1(){  
 var tupleString = "0 _ 0 _ r \n"  
 tupleString += "0 0 1 1 r\n"  
 tupleString += "0 1 1 0 r\n"  
 tupleString += "1 1 1 0 r\n"  
 tupleString += "1 0 1 1 r\n"  
  
 let tuplesArray = readTuples(tuplesAsString: tupleString)  
 let tvm = TuringVM(ttuplesArray: tuplesArray)  
 let result = tvm.runTuring(initialTape: "_101010_", initialState: 0, initialHead: 0)    
 print("Tuples:")  
 print(tvm.nakedTupleReport())  
 print("Initial String: \"_111000_\" Initial State: 0 Initial Head Position: 0")  
 print("\n*Running Turing*\n")  
 print("Number Steps In Run: \(result.numberSteps)")  
 print("Final Tape: \(result.finalTape)")  
 print("\nTrace:")  
 for line in result.trace{print("" + line)} 
} 

func example2(){
  var tupleString = "0 - 0 - r\n"
 tupleString += "0 1 2 x r\n"  
 tupleString += "2 1 2 1 r\n"  
 tupleString += "2 - 3 - r\n"
 tupleString += "3 1 3 1 r\n"
 tupleString += "3 - 4 1 l\n"
 tupleString += "4 1 4 1 l\n"
 tupleString += "4 - 5 - l\n"
 tupleString += "5 1 6 1 l\n"
 tupleString += "5 x 7 1 l\n"
 tupleString += "7 x 7 1 l\n"
 tupleString += "6 1 6 1 l\n"
 tupleString += "6 x 0 x r\n"
 
 let tuplesArray = readTuples(tuplesAsString: tupleString)  
 let tvm = TuringVM(ttuplesArray: tuplesArray)  
 let result = tvm.runTuring(initialTape: "-111----------", initialState: 0, initialHead: 0)    
 print("Tuples:")  
 print(tvm.nakedTupleReport())  
 print("Initial String: \"-111----------\" Initial State: 0 Initial Head Position: 0")  
 print("\n*Running Turing*\n")  
 print("Number Steps In Run: \(result.numberSteps)")  
 print("Final Tape: \(result.finalTape)")  
 print("\nTrace:")  
 for line in result.trace{print("" + line)}
}
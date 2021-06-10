class TuringVM{

  var numberSteps: Int
  let ttuplesArray: [TTuple]
 //you need some properties here. *Recall that we are storing our rules in a Dictionary.

 init(ttuplesArray: [TTuple]){
   self.ttuplesArray = ttuplesArray
   self.numberSteps = 0
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

//  }

 func runTuring(initialTape: String, initialState: Int, initialHead: Int) -> (numberSteps: Int, finalTape: String, trace: [String]){
   var trace: String = ""
   for bin in initialTape{
     print(bin)
   }
  return (numberSteps: 2, finalTape: "asd", trace: ["ho", "a"])
 }
}  

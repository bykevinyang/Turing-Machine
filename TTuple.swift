enum Direction{  
 case left 
 case right  
}

struct TTuple : CustomStringConvertible{  
 var currentState: Int  
 let inputChar: Character  
 let newState: Int  
 let outputChar: Character  
 let direction: Direction  

init(currentState:Int, inputChar: Character, newState: Int, outputChar: Character, direction: Direction){

  self.currentState = currentState
  self.inputChar = inputChar
  self.newState = newState
  self.outputChar = outputChar
  self.direction = direction
} 
 static func makeKey(_ state: Int, _ inputChar: Character)->String  {
   return String(state) + " " + String(inputChar)
 }

 func getKey()->String{
   return String(currentState) + " " + String(inputChar)
 }

 var description: String{
   return "cs: \(String(currentState)), ic: \(String(inputChar)), ns: \(String(newState)), oc: \(String(outputChar)), di: \(direction)"
 } 		//prints out TTuples with labels: cs, ic, ns, oc, di

 func nakedTuple()->String{
   var str = String(currentState) + String(inputChar) + String(newState) + String(outputChar)
  str = str.map { "\($0)" }.joined(separator: " ")
  if direction == .right{
    str += " r"
  }else{
    str += " l"
  }
   return str
 }
   	//prints out TTuples without labels; “naked”
}  

enum Direction{  
 case left 
 case right  
}  
struct TTuple : CustomStringConvertible{  
 let currentState: Int  
 let inputChar: Character  
 let newState: Int  
 let outputChar: Character  
 let direction: Direction  

init(currentState:Int, inputChar: Character, newState: Int, outputChar: Character, direction: Direction) 
 static func makeKey(state: Int, inputChar: Character)->String  
 func getKey()->String  
 var description: String  		//prints out TTuples with labels: cs, ic, ns, oc, di
 func nakedTuple()->String  	//prints out TTuples without labels; “naked”
}  

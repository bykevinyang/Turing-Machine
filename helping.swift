func splitStringIntoParts(expression: String)->[String]{  
 return expression.split{$0 == " "}.map{ String($0) }  
}  
func splitStringIntoLines(expression: String)->[String]{  
 return expression.split{$0 == "\n"}.map{ String($0) }  
}  

func readTuples(tuplesAsString: String)->[TTuple]{  
 var ttuples = [TTuple]()  
 let tuplesStringArray = splitStringIntoLines(expression: tuplesAsString)     
 for t in tuplesStringArray {ttuples.append(makeTTupleFromString(t))}  
 return ttuples  
}  
private func makeTTupleFromString(_ data: String)->TTuple{  
 var direction: Direction  
 let elements = splitStringIntoParts(expression: data)  
  
 let currentState = Int(elements[0])!  
 let newState = Int(elements[2])!  
 let inputChar = elements[1].first!  
 let outputChar = elements[3].first!  
 let directionAsChar = elements[4]  
  
 direction = (directionAsChar == "l") || (directionAsChar == "L") ? .left : .right   
 return TTuple(currentState: currentState, inputChar: inputChar, newState: newState, outputChar:  outputChar, direction: direction )  
} 

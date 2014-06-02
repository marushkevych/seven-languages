import scala.collection.mutable.ArrayBuffer

object HelloWorld {
	
	Grid.playX(0,0)                           //> 
                                                  //| |X|*|*|
                                                  //| |*|*|*|
                                                  //| |*|*|*|
	Grid.playX(1,1)                           //> 
                                                  //| |X|*|*|
                                                  //| |*|X|*|
                                                  //| |*|*|*|
	Grid.playX(2,1)                           //> 
                                                  //| |X|*|*|
                                                  //| |*|X|X|
                                                  //| |*|*|*|
	Grid.playX(0,1)                           //> 
                                                  //| |X|*|*|
                                                  //| |X|X|X|
                                                  //| |*|*|*|
	Grid.play0(0,2)                           //> 
                                                  //| |X|*|*|
                                                  //| |X|X|X|
                                                  //| |0|*|*|
	Grid.play0(1,2)                           //> 
                                                  //| |X|*|*|
                                                  //| |X|X|X|
                                                  //| |0|0|*|
	Grid.play0(2,2)                           //> 
                                                  //| |X|*|*|
                                                  //| |X|X|X|
                                                  //| |0|0|0|
	Grid.play0(1,0)                           //> 
                                                  //| |X|0|*|
                                                  //| |X|X|X|
                                                  //| |0|0|0|
	Grid.play0(1,0)                           //> 
                                                  //| |X|0|*|
                                                  //| |X|X|X|
                                                  //| |0|0|0|
	Grid.play0(2,0)                           //> 
                                                  //| |X|0|0|
                                                  //| |X|X|X|
                                                  //| |0|0|0|
	
                                     
                                     
	
	
	Grid.resolve                              //> Its a tie
                                                  
	
}

object Grid{
	val rows = Array(new Array[String](3),new Array[String](3),new Array[String](3))
	
	def playX(x:Int,y:Int) {
	  play("X",x,y)
	}
	def play0(x:Int,y:Int) {
	  play("0",x,y)
	}
	
	private def play(value:String, x:Int, y:Int){
		rows(y)(x)=value
		print
	}
	
	def foreach(f: (String,Int,Int)=>Unit){
		for(i<- 0 until 3){
			for(j <- 0 until 3){
				f(rows(i)(j), j, i)
			}
		}
	}
	
	def resolve() {
		var empties = 0
		val completed = new ArrayBuffer[String](0)
		
		def checkCompleted(line:Array[String]) = {
			//println("check line " + line.mkString)
			val xs = line.count(x => x == "X")
			val os = line.count {y =>
				y == "0"
			}
			
			
			if(xs == 3) {
				completed += "X"
			}
			
			if(os == 3) {
				completed += "0"
			}
			
		}
		
		// row1
		checkCompleted(Array(rows(0)(0),rows(1)(0),rows(2)(0)))
		// row2
		checkCompleted(Array(rows(0)(1),rows(1)(1),rows(2)(1)))
		// row3
		checkCompleted(Array(rows(0)(2),rows(1)(2),rows(2)(2)))

		// col1
		checkCompleted(Array(rows(0)(0),rows(0)(1),rows(0)(2)))
		// col2
		checkCompleted(Array(rows(1)(0),rows(1)(1),rows(1)(2)))
		// col3
		checkCompleted(Array(rows(2)(0),rows(2)(1),rows(2)(2)))
		
		// diag down
		checkCompleted(Array(rows(0)(0),rows(1)(1),rows(2)(2)))
		// diag up
		checkCompleted(Array(rows(0)(2),rows(1)(1),rows(2)(0)))
		
		// count empties
		foreach {(v,x,y) =>
			if(v == null) empties += 1
		}
		
		
		if(completed.size == 0 && empties == 0) println("Its a tie")
		else {
			//println("completed size " + completed.size)
			val xs = completed.count(x => x == "X")
			val os = completed.count(y => y == "0")
			
			if(xs > os) println("X is winner!")
			else if(os > xs) println("0 is winner!")
			else if(empties == 0) println("Its a tie")
		}
		
	}
	
	def print = {
		println
		rows.foreach(row => printRow(row) )
		
		def printRow(row:Array[String]) {
			Console.print("|")
			row.foreach {
				case null => Console.print("*|")
				case cell => Console.print(cell+"|")
			}
			println
		}
	}
}
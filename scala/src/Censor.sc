import scala.collection.mutable.ListBuffer
import scala.collection.mutable.HashMap
import scala.io._

object CensorTest {


	val censor = new TextCensor("C:/Dev/Scala/SevenLanguages/src/censor-map.txt")
                                                  //> censor  : TextCensor = TextCensor@48d19bc8
	censor.cense("Oh Shoot ! I'll kill you, you Darn crook!")
                                                  //> res0: String = Oh Pucky ! I'll kill you, you Beans crook!
	
	censor.censeFile("C:/Dev/Scala/SevenLanguages/src/file.txt")
                                                  //> res1: List[String] = List(Oh Pucky ! I'll kill you, you Beans crook!, Oh Puc
                                                  //| ky ! I'll kill you, you Beans crook!, Oh Pucky ! I'll kill you, you Beans cr
                                                  //| ook!)
  
  
}

trait Censor {

	def map:Map[String,String];
	
	def cense(text:String):String = {
		val list = text.split(" ").toList
		val translation = new ListBuffer[String]();
		list foreach { word =>
			map.get(word) match {
				case Some(x) => translation += x;
				case None => translation += word;
			}
		}
		translation.mkString(" ")
	}
	
	def censeLines(lines: Iterator[String]):List[String] = {
		val translation = new ListBuffer[String]();
		lines.foreach(line => translation += cense(line))
		translation.toList
	}
}

class TextCensor(mapFile:String) extends Censor {

	override def map:Map[String,String] = {
	  
	  // load map from file
	  val map = new HashMap[String,String]()
	  val entries = Source.fromFile(mapFile:String).getLines()
	  entries foreach {string =>
	  	val pair = string.split(" ")
	  	map += pair(0) -> pair(1)
	  }
	  
	  map.toMap
	}
	
	def censeFile(fileName:String):List[String] = {
		val lines = Source.fromFile(fileName).getLines()
		censeLines(lines)
	}
	

}
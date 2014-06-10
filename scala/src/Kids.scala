import scala.actors._ 
import scala.actors.Actor._

object Kids extends App {
	println("Hello")
	
	val kidA = new Kid("A").start
	val kidB = new Kid("B").start
	
	kidA ! Poke
	kidA ! Feed
	kidB ! Poke
	kidB ! Feed
}

case object Poke
case object Feed

class Kid(name: String) extends Actor {

  def act() = {
    println("kid" + name + " started")
    loop {

      react {
        case Poke => println("kid" + name + " is poked")
        case Feed => println("kid" + name + " is fed")
      }
    }

  }

}
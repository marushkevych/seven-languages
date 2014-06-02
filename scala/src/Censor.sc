object Censor {
	
	val map = Map(
		"Shoot" -> "Pucky",
		"Darn" -> "Beans"
	)                                         //> map  : scala.collection.immutable.Map[String,String] = Map(Shoot -> Pucky, Da
                                                  //| rn -> Beans)
	
	val words = "this is a sentence".split(" ").toList
                                                  //> words  : List[String] = List(this, is, a, sentence)
}
object foldLeft {
  
  val list = List("foo", "bar", "o", "words")     //> list  : List[String] = List(foo, bar, o, words)
  
  def countLetters(l:List[String]) = {
  	l.foldLeft(0)( (a,b) => a + b.size )
  }                                               //> countLetters: (l: List[String])Int
  
  countLetters(list)                              //> res0: Int = 12
}
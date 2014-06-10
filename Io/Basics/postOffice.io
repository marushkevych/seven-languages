PostOffice := Object clone

PostOffice packageSender := method(call sender)
PostOffice messageTarget := method(call target)
PostOffice messageArgs := method(call message arguments)
PostOffice messageName := method(call message name)
PostOffice executeMessage := method("postOffice executeMessage is called" println; call sender doMessage(call message))

postOffice := PostOffice clone

Mailer := Object clone
Mailer deliver := method(postOffice packageSender)
Mailer callExecuteMessage := method(postOffice executeMessage("foo", "bar"))
Mailer executeMessage := method("mailer executeMessage is called with " print; call message arguments println)
mailer := Mailer clone

mailer deliver println
postOffice messageTarget println
postOffice messageArgs("one", 2+2, :three) println
postOffice messageName println


mailer callExecuteMessage

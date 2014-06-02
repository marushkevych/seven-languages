OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(key, value,
    self atPut(key asMutable removePrefix("\"") removeSuffix("\""), value)
)

curlyBrackets := method(arg,
    r := Map clone
    call message arguments foreach(arg,
           r doMessage(arg)
    )
    r
)




Builder := Object clone
Builder indentValue := ""
Builder indent := method(
    indentValue = indentValue .. "\t"
)

Builder unIndent := method(
    indentValue = indentValue asMutable removeLast
)

Builder forward := method(
    writeln(indentValue,"<", call message name, ">")
    indent
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(indentValue,content))
    )
    unIndent
    writeln(indentValue,"</", call message name, ">")
)

Builder ul(
    //{"foo" : "bar"},
    li("Io"),
    li("Lua"),
    li("JavaScript")
)
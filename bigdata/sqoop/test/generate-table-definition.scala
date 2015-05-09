#! /bin/bash
exec scala "$0" "$@"
!#

import scala.collection.mutable
import scala.collection.mutable.ListBuffer
import scala.io.Source
import sys.process._


var tableMap = new mutable.HashMap[String, mutable.ListBuffer[String]]()
var table=""
for(line:String <- Source.fromFile("table_desc.txt").getLines()){
    val _line:String = line.trim()
    if(_line != ""){
        if(_line.startsWith("create table")){
            table = _line.split("\\s+")(2).trim()
        }else if(table!=""){
            tableMap.getOrElseUpdate(table, new scala.collection.mutable.ListBuffer[String]())
            tableMap(table).append("    "+_line.replaceAll("\t"," "))
        }

    }else{
        table = ""
    }
}

val script = tableMap.map{
    case (table, lines:ListBuffer[String]) =>
        var str = s"drop table $table;\ncreate table $table(\n"
        str += lines.mkString(",\n")
        if(str.contains("created_at"))
            str += ")\n" +
                   "partitioned by(date string);\n\n"
        else
            str += ");\n\n"
        str
}

var writer = new java.io.FileWriter("hive-tables.sql",true)
script.foreach(writer.append(_))
writer.close()
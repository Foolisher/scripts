#!/bin/sh
exec scala "$0" "$@"
!#

import sys.process._
import scala.io.Source
import java.text.SimpleDateFormat
import java.util.Locale

val lines=Source.fromFile(s"groupon-web-access.log","UTF-8").getLines

val fmt = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss")
val parser = new SimpleDateFormat("dd/MMM/yyyy:HH:mm:ss", Locale.US)

//         ip                          datetime       url                   User-Agent
val reg="""(\d+.\d+.\d+.\d+) .*? .*? \[(.*) \+0800\] "(.*?)" \d+ \d+ ".*?" "(.*?)"""".r

import java.io.PrintWriter
val writer = new PrintWriter("result.txt")
for(l <- lines){
	val reg(ip, datetime, url, user_agent)=l
    if(ip != None && datetime != None && url != None && user_agent != None)
	    writer.append(s"$ip\001${fmt.format(parser.parse(datetime))}\001${url.replaceAll("(GET )|(POST )|(PUT )|(DELETE )|(OPTIONS )|( HTTP/[012].[012].*$)|(\\?.*$)","")}\001${user_agent.replaceAll(","," ")}\n")
}
writer.close()


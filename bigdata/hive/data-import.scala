#!/bin/sh
exec scala "$0" "$@"
!#

import sys.process._
import scala.io.Source
import java.text.SimpleDateFormat;
import java.util.Locale

val root="/Users/wanggen/workspace"
val lines=Source.fromFile(s"$root/groupon-web-access.log","UTF-8").getLines

val fmt = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss")
val parser = new SimpleDateFormat("dd/MMM/yyyy:HH:mm:ss", Locale.US)

//         ip                          datetime       url                   User-Agent
val reg="""(\d+.\d+.\d+.\d+) .*? .*? \[(.*) \+0800\] "(.*?)" \d+ \d+ ".*?" "(.*?)"""".r

import java.io.PrintWriter
val writer = new PrintWriter("result.txt")
for(l <- lines){
	val reg(ip, datetime, url, user_agent)=l
	writer.append(s"$ip,${fmt.format(parser.parse(datetime))},${url.replaceAll("(GET )|(POST )|( HTTP/1.1)","")},${user_agent.replaceAll(","," ")}\n")
}
writer.close()


#!/bin/sh
exec scala "$0" "$@"
!#

import sys.process._
import scala.io.Source

for(table <- Source.fromFile("tables").getLines()){
    s"./import-one-table-to-hive.sh $table" !
}


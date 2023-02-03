#!/bin/bash
set -e

sed '/module.allow_web_admin/a\
c3p0.min_size=0\
c3p0.max_size=150\
c3p0.max_statements=0\
c3p0.maxStatementsPerConnection=0\
c3p0.maxIdleTime=5\
c3p0.maxIdleTimeExcessConnections=5\
c3p0.numHelperThreads=10' ./startup-init.sh > ./startup-init-temp.sh

rm ./startup-init.sh
mv ./startup-init-temp.sh ./startup-init.sh


maxIdleTime
maxIdleTimeExcessConnections
numHelperThreads
maxStatements
maxStatementsPerConnection
#!/bin/bash

SPARK_MASTER_URL="spark://spark-master:7077"
PY_FILES="sdbl_lib.zip"
FILES="conf/sdbl.conf,conf/spark.conf,log4j.properties"
DRIVER_CORES=2
DRIVER_MEMORY="3G"
MEMORY_OVERHEAD="1G"
APP_NAME="main.py"
ENVIRONMENT="qa"
RUN_DATE="2022-08-03"

spark-submit \
  --master $SPARK_MASTER_URL \
  --deploy-mode cluster \
  --py-files $PY_FILES \
  --files $FILES \
  --driver-cores $DRIVER_CORES \
  --driver-memory $DRIVER_MEMORY \
  --conf spark.driver.memoryOverhead=$MEMORY_OVERHEAD \
  $APP_NAME $ENVIRONMENT $RUN_DATE

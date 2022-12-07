#!/bin/bash
########################################################
#                                                      #
#  Program: collect_su_data.sh                         #                                                 
#  Desc.  : Collect AIX su information with "Year"     #
#  Author : lukehsu1202                                #
#  Version: V1.0                                       #
#                                                      #
########################################################

>/var/adm/sulog_1

>/var/adm/su_tmp_1

cat /var/adm/sulog > /var/adm/su_tmp

CNT_1=`cat /var/adm/su_tmp|wc -l`

CNT_2=1

while [[ $CNT_2 -le $CNT_1 ]]

  do

    cat /var/adm/su_tmp|tail -$CNT_2|head -1 > /var/adm/su_tmp_2

    exec 3< /var/adm/su_tmp_2

    while read -u3 L1 L2 L3 L4 L5 L6

      do

        M1=`echo $L2|awk -F "/" '{print $1}'`

        M2=`echo $L2|awk -F "/" '{print $2}'`

        if [ "$CNT_2" -eq 1 ]

        then

          YR_1=`date|awk '{print $6}'`

          S1=`date|awk '{print $2}'`

          if [ "$S1" = "Jan" ]; then

            S1=01

          elif [ "$S1" = "Feb" ]; then

            S1=02

          elif [ "$S1" = "Mar" ]; then

            S1=03

          elif [ "$S1" = "Apr" ]; then

            S1=04

          elif [ "$S1" = "May" ]; then

            S1=05

          elif [ "$S1" = "May" ]; then

            S1=06

          elif [ "$S1" = "Jul" ]; then

            S1=07

          elif [ "$S1" = "Aug" ]; then

            S1=08

          elif [ "$S1" = "Sep" ]; then

            S1=09

          elif [ "$S1" = "Oct" ]; then

            S1=10

          elif [ "$S1" = "Nov" ]; then

            S1=11

          elif [ "$S1" = "Dec" ]; then

            S1=12

          fi

          echo "$L1 $YR_1-$M1-$M2 $L3 $L4 $L5 $L6" >> /var/adm/su_tmp_1

        else

          if [ "$M1" -gt "S1" ];then

            let YR_1=YR_1-1

            S1="$M1"

            echo "$L1 $YR_1-$M1-$M2 $L3 $L4 $L5 $L6" >> /var/adm/su_tmp_1

          else

            S1="$M1"

            echo "$L1 $YR_1-$M1-$M2 $L3 $L4 $L5 $L6" >> /var/adm/su_tmp_1

          fi

        fi

    done

    let CNT_2=CNT_2+1

done

 

CNT_3=1

while [[ $CNT_3 -le $CNT_1 ]]

  do

    cat /var/adm/su_tmp_1|tail -$CNT_3|head -1 >> /var/adm/sulog_1

    let BCNT_3=CNT_3+1

done
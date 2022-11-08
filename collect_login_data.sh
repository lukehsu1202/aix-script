#!/bin/bash
########################################################
#                                                      #
#  Program: collect_login_data.sh                      #                                                 
#  Desc.  : Collect AIX login information with "Year"  #
#  Author : lukehsu1202                                #
#  Version: V1.0                                       #
#                                                      #
########################################################

> /var/adm/logins
/usr/sbin/acct/fwtmp < /var/adm/wtmp > /var/adm/logins_log
cat /var/adm/logins_log|egrep "vty|pts|ftp|system boot|shutdown "|egrep "10\.|tpe|vty0          7|system boot|shutdown "|grep -v nudge > /var/adm/logins_log_ip
cat /var/adm/logins_log|egrep "vty|pts|ftp|system boot|shutdown "|egrep -v "10\.|tpe|vty0          7|system boot|shutdown " > /var/adm/logins_log_noip
cat /var/adm/logins_log|egrep -v "vty|pts|ftp|system boot|shutdown " >> /var/adm/logins_log_noip
exec 9< /var/adm/logins_log_ip

while read -u9 L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 L11 L12 L13 L14 L15
do 
  if [ "$L1" = "shutdown" ]; then
    if [ "$L9" = "Jan" ]; then
      L9=01
    elif [ "$L9" = "Feb" ]; then
      L9=02
    elif [ "$L9" = "Mar" ]; then
      L9=03
    elif [ "$L9" = "Apr" ]; then
      L9=04
    elif [ "$L9" = "May" ]; then
      L9=05
    elif [ "$L9" = "Jun" ]; then
      L9=06
    elif [ "$L9" = "Jul" ]; then
      L9=07
    elif [ "$L9" = "Aug" ]; then
      L9=08
    elif [ "$L9" = "Sep" ]; then
      L9=09
    elif [ "$L9" = "Oct" ]; then
      L9=10
    elif [ "$L9" = "Nov" ]; then
      L9=11
    elif [ "$L9" = "Dec" ]; then
      L9=12
    fi

    if [ "$L10" -lt 10 ]; then
      L10="0$L10"
    fi
    
    echo "$L1 $L2 none $L13$L9$L10 $L11" >> /var/adm/logins 
  
  elif [[ "$L1" = "system" && "$L2" = "boot" ]]; then
    if [ "$L9" = "Jan" ]; then
      L9=01
    elif [ "$L9" = "Feb" ]; then
      L9=02
    elif [ "$L9" = "Mar" ]; then
      L9=03
    elif [ "$L9" = "Apr" ]; then
      L9=04
    elif [ "$L9" = "May" ]; then
      L9=05
    elif [ "$L9" = "Jun" ]; then
      L9=06
    elif [ "$L9" = "Jul" ]; then
      L9=07
    elif [ "$L9" = "Aug" ]; then
      L9=08
    elif [ "$L9" = "Sep" ]; then
      L9=09
    elif [ "$L9" = "Oct" ]; then
      L9=10
    elif [ "$L9" = "Nov" ]; then
      L9=11
    elif [ "$L9" = "Dec" ]; then
      L9=12
    fi 
   
    if [ "$L10" -lt 10 ]; then
      L10="0$L10"
    fi

    echo "reboot ~ none $L13$L9$L10 $L11" >> /var/adm/logins
  elif [ "$L3" = "6" ]; then
    : 
  elif [[ "$L3" = "vty0" && "$L4" = "7" ]]; then
    if [ "$L10" = "Jan" ]; then
      L10=01
    elif [ "$L10" = "Feb" ]; then
      L10=02
    elif [ "$L10" = "Mar" ]; then
      L10=03
    elif [ "$L10" = "Apr" ]; then
      L10=04
    elif [ "$L10" = "May" ]; then
      L10=05
    elif [ "$L10" = "Jun" ]; then
      L10=06
    elif [ "$L10" = "Jul" ]; then
      L10=07
    elif [ "$L10" = "Aug" ]; then
      L10=08
    elif [ "$L10" = "Sep" ]; then
      L10=09
    elif [ "$L10" = "Oct" ]; then
      L10=10
    elif [ "$L10" = "Nov" ]; then
      L10=11
    elif [ "$L10" = "Dec" ]; then
      L10=12
    fi

    if [ "$L11" -lt 10 ]; then
      L11="0$L11"
    fi
  
    T1=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "0001"|wc -l`
    T2=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "0001"|awk '{print $9}'`
    T3=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "0001"|awk '{print $10}'`
    T4=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "0001"|awk '{print $11}'`
    T5=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "0001"|awk '{print $13}'` 

    if [ "$T2" = "Jan" ]; then
      T2=01
    elif [ "$T2" = "Feb" ]; then
      T2=02
    elif [ "$T2" = "Mar" ]; then
      T2=03
    elif [ "$T2" = "Apr" ]; then
      T2=04
    elif [ "$T2" = "May" ]; then
      T2=05
    elif [ "$T2" = "Jun" ]; then
      T2=06
    elif [ "$T2" = "Jul" ]; then
      T2=07
    elif [ "$T2" = "Aug" ]; then
      T2=08
    elif [ "$T2" = "Sep" ]; then
      T2=09
    elif [ "$T2" = "Oct" ]; then
      T2=10
    elif [ "$T2" = "Nov" ]; then
      T2=11
    elif [ "$T2" = "Dec" ]; then
      T2=12
    fi
 
    if [ "$T3" = "1" ]; then
      T3=01
    elif [ "$T3" = "2" ]; then 
      T3=02
    elif [ "$T3" = "3" ]; then
      T3=03
    elif [ "$T3" = "4" ]; then
      T3=04
    elif [ "$T3" = "5" ]; then
      T3=05
    elif [ "$T3" = "6" ]; then
      T3=06
    elif [ "$T3" = "7" ]; then
      T3=07
    elif [ "$T3" = "8" ]; then
      T3=08
    elif [ "$T3" = "9" ]; then
      T3=09
    fi
 
    if [ "$T1" -eq 1 ]; then  
      echo "$L1 $L3 none $L14$L10$L11 $L12 - $T5$T2$T3 $T4" >> /var/adm/logins
    else
      echo "$L1 $L3 none $L14$L10$L11 $L12" >> /var/adm/logins
    fi

  else
    if [ "$L11" = "Jan" ]; then
      L11=01
    elif [ "$L11" = "Feb" ]; then
      L11=02
    elif [ "$L11" = "Mar" ]; then
      L11=03
    elif [ "$L11" = "Apr" ]; then
      L11=04
    elif [ "$L11" = "May" ]; then
      L11=05
    elif [ "$L11" = "Jun" ]; then
      L11=06
    elif [ "$L11" = "Jul" ]; then
      L11=07
    elif [ "$L11" = "Aug" ]; then
      L11=08
    elif [ "$L11" = "Sep" ]; then
      L11=09
    elif [ "$L11" = "Oct" ]; then
      L11=10
    elif [ "$L11" = "Nov" ]; then
      L11=11
    elif [ "$L11" = "Dec" ]; then
      L11=12
    fi
   
    if [ "$L12" -lt 10 ]; then
      L12="0$L12"
    fi  
    
    T1=`cat /var/adm/logins_log_noip|grep "$L5 "|wc -l`

    if [ "$T1" -eq 1 ]; then
      T2=`cat /var/adm/logins_log_noip|grep "$L5 "|awk '{print $9}'`
      T3=`cat /var/adm/logins_log_noip|grep "$L5 "|awk '{print $10}'`
      T4=`cat /var/adm/logins_log_noip|grep "$L5 "|awk '{print $11}'`
      T5=`cat /var/adm/logins_log_noip|grep "$L5 "|awk '{print $13}'`

      if [ "$T2" = "Jan" ]; then
        T2=01
      elif [ "$T2" = "Feb" ]; then
        T2=02
      elif [ "$T2" = "Mar" ]; then
        T2=03
      elif [ "$T2" = "Apr" ]; then
        T2=04
      elif [ "$T2" = "May" ]; then
        T2=05
      elif [ "$T2" = "Jun" ]; then
        T2=06
      elif [ "$T2" = "Jul" ]; then
        T2=07
      elif [ "$T2" = "Aug" ]; then
        T2=08
      elif [ "$T2" = "Sep" ]; then
        T2=09
      elif [ "$T2" = "Oct" ]; then
        T2=10
      elif [ "$T2" = "Nov" ]; then
        T2=11
      elif [ "$T2" = "Dec" ]; then
        T2=12
      fi

      if [ "$T3" = "1" ]; then
        T3=01
      elif [ "$T3" = "2" ]; then
        T3=02
      elif [ "$T3" = "3" ]; then
        T3=03
      elif [ "$T3" = "4" ]; then
        T3=04
      elif [ "$T3" = "5" ]; then
        T3=05
      elif [ "$T3" = "6" ]; then
        T3=06
      elif [ "$T3" = "7" ]; then
        T3=07
      elif [ "$T3" = "8" ]; then
        T3=08
      elif [ "$T3" = "9" ]; then
        T3=09
      fi
      echo "$L1 $L2 $L9 $L15$L11$L12 $L13 - $T5$T2$T3 $T4" >> /var/adm/logins
    elif [ "$T1" -gt 1 ]; then
      T1=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L8 "|wc -l` 
      T2=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L8 "|awk '{print $9}'`
      T3=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L8 "|awk '{print $10}'`
      T4=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L8 "|awk '{print $11}'`
      T5=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L8 "|awk '{print $13}'`
 
      if [ "$T1" -eq 1 ]; then
        if [ "$T2" = "Jan" ]; then
          T2=01
        elif [ "$T2" = "Feb" ]; then
          T2=02
        elif [ "$T2" = "Mar" ]; then
          T2=03
        elif [ "$T2" = "Apr" ]; then
          T2=04
        elif [ "$T2" = "May" ]; then
          T2=05
        elif [ "$T2" = "Jun" ]; then
          T2=06
        elif [ "$T2" = "Jul" ]; then
          T2=07
        elif [ "$T2" = "Aug" ]; then
          T2=08
        elif [ "$T2" = "Sep" ]; then
          T2=09
        elif [ "$T2" = "Oct" ]; then
          T2=10
        elif [ "$T2" = "Nov" ]; then
          T2=11
        elif [ "$T2" = "Dec" ]; then
          T2=12
        fi

        if [ "$T3" = "1" ]; then
          T3=01
        elif [ "$T3" = "2" ]; then
          T3=02
        elif [ "$T3" = "3" ]; then
          T3=03
        elif [ "$T3" = "4" ]; then
          T3=04
        elif [ "$T3" = "5" ]; then
          T3=05
        elif [ "$T3" = "6" ]; then
          T3=06
        elif [ "$T3" = "7" ]; then
          T3=07
        elif [ "$T3" = "8" ]; then
          T3=08
        elif [ "$T3" = "9" ]; then
          T3=09
        fi
 
        echo "$L1 $L2 $L9 $L15$L11$L12 $L13 - $T5$T2$T3 $T4" >> /var/adm/logins
      elif [ "$T1" -eq 0 ]; then
        T6=`expr $L8 + 1` 
        T1=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$T6 "|wc -l`
        if [ "$T1" -eq 1 ]; then
          T2=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$T6 "|awk '{print $9}'`
          T3=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$T6 "|awk '{print $10}'`
          T4=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$T6 "|awk '{print $11}'`
          T5=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$T6 "|awk '{print $13}'`
   
          if [ "$T2" = "Jan" ]; then
            T2=01
          elif [ "$T2" = "Feb" ]; then
            T2=02
          elif [ "$T2" = "Mar" ]; then
            T2=03
          elif [ "$T2" = "Apr" ]; then
            T2=04
          elif [ "$T2" = "May" ]; then
            T2=05
          elif [ "$T2" = "Jun" ]; then
            T2=06
          elif [ "$T2" = "Jul" ]; then
            T2=07
          elif [ "$T2" = "Aug" ]; then
            T2=08
          elif [ "$T2" = "Sep" ]; then
            T2=09
          elif [ "$T2" = "Oct" ]; then
            T2=10
          elif [ "$T2" = "Nov" ]; then
            T2=11
          elif [ "$T2" = "Dec" ]; then
            T2=12
          fi

          if [ "$T3" = "1" ]; then
            T3=01
          elif [ "$T3" = "2" ]; then
            T3=02
          elif [ "$T3" = "3" ]; then
            T3=03
          elif [ "$T3" = "4" ]; then
            T3=04
          elif [ "$T3" = "5" ]; then
            T3=05
          elif [ "$T3" = "6" ]; then
            T3=06
          elif [ "$T3" = "7" ]; then
            T3=07
          elif [ "$T3" = "8" ]; then
            T3=08
          elif [ "$T3" = "9" ]; then
            T3=09
          fi

          echo "$L1 $L2 $L9 $L15$L11$L12 $L13 - $T5$T2$T3 $T4" >> /var/adm/logins
        elif [ "$T1" -eq 0 ]; then
          T1=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|wc -l`         
          if [ "$T1" -eq 1 ]; then
            T2=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|awk '{print $9}'`
            T3=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|awk '{print $10}'`
            T4=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|awk '{print $11}'`
            T5=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|awk '{print $13}'`
            if [ "$T2" = "Jan" ]; then
              T2=01
            elif [ "$T2" = "Feb" ]; then
              T2=02
            elif [ "$T2" = "Mar" ]; then
              T2=03
            elif [ "$T2" = "Apr" ]; then
              T2=04
            elif [ "$T2" = "May" ]; then
              T2=05
            elif [ "$T2" = "Jun" ]; then
              T2=06
            elif [ "$T2" = "Jul" ]; then
              T2=07
            elif [ "$T2" = "Aug" ]; then
              T2=08
            elif [ "$T2" = "Sep" ]; then
              T2=09
            elif [ "$T2" = "Oct" ]; then
              T2=10
            elif [ "$T2" = "Nov" ]; then
              T2=11
            elif [ "$T2" = "Dec" ]; then
              T2=12
            fi

            if [ "$T3" = "1" ]; then
              T3=01
            elif [ "$T3" = "2" ]; then
              T3=02
            elif [ "$T3" = "3" ]; then
              T3=03
            elif [ "$T3" = "4" ]; then
              T3=04
            elif [ "$T3" = "5" ]; then
              T3=05
            elif [ "$T3" = "6" ]; then
              T3=06
            elif [ "$T3" = "7" ]; then
              T3=07
            elif [ "$T3" = "8" ]; then
              T3=08
            elif [ "$T3" = "9" ]; then
              T3=09
            fi 
            echo "$L1 $L2 $L9 $L15$L11$L12 $L13 - $T5$T2$T3 $T4" >> /var/adm/logins
          elif [ "$T1" -eq 0 ]; then 
            echo "$L1 $L2 $L9 $L15$L11$L12 $L13 still logged in." >> /var/adm/logins
          elif [ "$T1" -gt 1 ]; then
            T1=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|grep "$L2"|wc -l`
            if [ "$T1" -eq 1 ]; then
            T2=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|grep "$L2"|awk '{print $9}'`
            T3=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|grep "$L2"|awk '{print $10}'`
            T4=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|grep "$L2"|awk '{print $11}'`
            T5=`cat /var/adm/logins_log_noip|grep "$L5 "|grep "$L15"|grep "$L2"|awk '{print $13}'`
            if [ "$T2" = "Jan" ]; then
              T2=01
            elif [ "$T2" = "Feb" ]; then
              T2=02
            elif [ "$T2" = "Mar" ]; then
              T2=03
            elif [ "$T2" = "Apr" ]; then
              T2=04
            elif [ "$T2" = "May" ]; then
              T2=05
            elif [ "$T2" = "Jun" ]; then
              T2=06
            elif [ "$T2" = "Jul" ]; then
              T2=07
            elif [ "$T2" = "Aug" ]; then
              T2=08
            elif [ "$T2" = "Sep" ]; then
              T2=09
            elif [ "$T2" = "Oct" ]; then
              T2=10
            elif [ "$T2" = "Nov" ]; then
              T2=11
            elif [ "$T2" = "Dec" ]; then
              T2=12
            fi

            if [ "$T3" = "1" ]; then
              T3=01
            elif [ "$T3" = "2" ]; then
              T3=02
            elif [ "$T3" = "3" ]; then
              T3=03
            elif [ "$T3" = "4" ]; then
              T3=04
            elif [ "$T3" = "5" ]; then
              T3=05
            elif [ "$T3" = "6" ]; then
              T3=06
            elif [ "$T3" = "7" ]; then
              T3=07
            elif [ "$T3" = "8" ]; then
              T3=08
            elif [ "$T3" = "9" ]; then
              T3=09
            fi
            fi
            echo "$L1 $L2 $L9 $L15$L11$L12 $L13 - $T5$T2$T3 $T4" >> /var/adm/logins
          fi
        fi
      fi  
    
    elif [ "$T1" -eq 0 ]; then
      echo "$L1 $L2 $L9 $L15$L11$L12 $L13 still logged in." >> /var/adm/logins
    fi 
   
  fi
done

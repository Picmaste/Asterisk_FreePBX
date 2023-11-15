#!/bin/bash
# Удаление пользователей
# SubNet \ $1  подсеть
# Us=$2 стартовый номер 
# Key \ $3 признак хоста 0 - мобильный клиент , 2 - очередь  , 7 -квартира 
# cnt=$4  количество  
 
   
   
   AsterDir=/etc/asterisk
   
   
   PJS=pjsip_custom.conf
   PJAOR=pjsip.aor_custom.conf #Address of Record  -Enddpoint
   PJI=pjsip.identify_custom.conf
   PJAU=pjsip.auth_custom.conf  ;
   PJEND=pjsip.endpoint_custom.conf
   Q=queues_custom.conf  ;
   EXT=extensions_custom.conf  
   SubNet=$1
   declare -i Us=$2;
   declare -i cnt=$3
   
   #Очистка всех файлов 
   echo " " >  $AsterDir/$EXT
   echo " " >  $AsterDir/$PJS
   echo " " >  $AsterDir/$PJAOR
   echo " " >  $AsterDir/$PJAU
   echo " " >  $AsterDir/$PJEND
   echo " " >  $AsterDir/$Q
   
   
   #Удаление из ДБ данных в  DB
   
   declare -i Us=$2;
   echo "Work Dialplan- [DB ]"
   echo " " >>  $AsterDir/$EXT
   for ((i=$cnt ; i > 0 ; i-- ))
   do 
   
   TTTT=""
   if [ $Us -lt 1000 ]
   then 
   TTTT=0
   fi
   if [ $Us -lt 100 ]
   then 
   TTTT="$TTTT"0
   fi
   if [ $Us -lt 10 ]
   then 
   TTTT="$TTTT"0
   fi
   
   Users="$TTTT"$Us
   echo DELETE $10$Users
   
   asterisk -rx "database del AMPUSER $101$Users/answermode 		"
   asterisk -rx "database del AMPUSER $10$Users/cfringtimer 		"
   asterisk -rx "database del AMPUSER $10$Users/cidname      		"
   asterisk -rx "database del AMPUSER $10$Users/cidnum  			"
   asterisk -rx "database del AMPUSER $10$Users/concurrency_limit         "
   asterisk -rx "database del AMPUSER $10$Users/cwtone                    "
   asterisk -rx "database del AMPUSER $10$Users/device                    "
   asterisk -rx "database del AMPUSER $10$Users/dictate/email                "
   asterisk -rx "database del AMPUSER $10$Users/dictate/enabled           "
   asterisk -rx "database del AMPUSER $10$Users/dictate/format            "
   asterisk -rx "database del AMPUSER $10$Users/dictate/from              "
   asterisk -rx "database del AMPUSER $10$Users/followme/annmsg           "
   asterisk -rx "database del AMPUSER $10$Users/followme/changecid        "
   asterisk -rx "database del AMPUSER $10$Users/followme/ddial            "
   asterisk -rx "database del AMPUSER $10$Users/followme/dring            "
   asterisk -rx "database del AMPUSER $10$Users/followme/fixedcid         "
   asterisk -rx "database del AMPUSER $10$Users/followme/grpconf          "
   asterisk -rx "database del AMPUSER $10$Users/followme/grplist          "
   asterisk -rx "database del AMPUSER $10$Users/followme/grppre           "
   asterisk -rx "database del AMPUSER $10$Users/followme/grptime          "
   asterisk -rx "database del AMPUSER $10$Users/followme/postdest         "
   asterisk -rx "database del AMPUSER $10$Users/followme/prering          "
   asterisk -rx "database del AMPUSER $10$Users/followme/remotealertmsg   "
   asterisk -rx "database del AMPUSER $10$Users/followme/ringing          "
   asterisk -rx "database del AMPUSER $10$Users/followme/rvolume          "
   asterisk -rx "database del AMPUSER $10$Users/followme/strategy          "
   asterisk -rx "database del AMPUSER $10$Users/followme/toolatemsg        "
   asterisk -rx "database del AMPUSER $10$Users/hint                   "
   asterisk -rx "database del AMPUSER $10$Users/intercom                           "
   asterisk -rx "database del AMPUSER $10$Users/intercom/override                  "
   asterisk -rx "database del AMPUSER $10$Users/language                          "
   asterisk -rx "database del AMPUSER $10$Users/noanswer                          "
   asterisk -rx "database del AMPUSER $10$Users/outboundcid                        "
   asterisk -rx "database del AMPUSER $10$Users/password                          "
   asterisk -rx "database del AMPUSER $10$Users/queues/qnostate                    "
   asterisk -rx "database del AMPUSER $10$Users/recording                          "
   asterisk -rx "database del AMPUSER $10$Users/recording/in/external              "
   asterisk -rx "database del AMPUSER $10$Users/recording/in/internal              "
   asterisk -rx "database del AMPUSER $10$Users/recording/ondemand                 "
   asterisk -rx "database del AMPUSER $10$Users/recording/out/external             "
   asterisk -rx "database del AMPUSER $10$Users/recording/out/internal             "
   asterisk -rx "database del AMPUSER $10$Users/recording/priority                 "
   asterisk -rx "database del AMPUSER $10$Users/ringtimer                          "
   asterisk -rx "database del AMPUSER $10$Users/rvolume "
   asterisk -rx "database del AMPUSER $10$Users/voicemail                      "
   
   asterisk -rx "database del CALLTRACE $10$Users                          "
   asterisk -rx "database del CW $10$Users                         "
   asterisk -rx "database del CustomDevstate FOLLOWME$10$Users    "
   asterisk -rx "database del DEVICE  $10$Users/default_user      "
   asterisk -rx "database del DEVICE  $10$Users/dial "
   asterisk -rx "database del DEVICE  $10$Users/tech "
   asterisk -rx "database del DEVICE  $10$Users/type "
   asterisk -rx "database del DEVICE  $10$Users/user "
   
   echo DELETE $17$Users
   
   asterisk -rx "database del AMPUSER $171$Users/answermode 		"
   asterisk -rx "database del AMPUSER $17$Users/cfringtimer 		"
   asterisk -rx "database del AMPUSER $17$Users/cidname      		"
   asterisk -rx "database del AMPUSER $17$Users/cidnum  			"
   asterisk -rx "database del AMPUSER $17$Users/concurrency_limit         "
   asterisk -rx "database del AMPUSER $17$Users/cwtone                    "
   asterisk -rx "database del AMPUSER $17$Users/device                    "
   asterisk -rx "database del AMPUSER $17$Users/dictate/email                "
   asterisk -rx "database del AMPUSER $17$Users/dictate/enabled           "
   asterisk -rx "database del AMPUSER $17$Users/dictate/format            "
   asterisk -rx "database del AMPUSER $17$Users/dictate/from              "
   asterisk -rx "database del AMPUSER $17$Users/followme/annmsg           "
   asterisk -rx "database del AMPUSER $17$Users/followme/changecid        "
   asterisk -rx "database del AMPUSER $17$Users/followme/ddial            "
   asterisk -rx "database del AMPUSER $17$Users/followme/dring            "
   asterisk -rx "database del AMPUSER $17$Users/followme/fixedcid         "
   asterisk -rx "database del AMPUSER $17$Users/followme/grpconf          "
   asterisk -rx "database del AMPUSER $17$Users/followme/grplist          "
   asterisk -rx "database del AMPUSER $17$Users/followme/grppre           "
   asterisk -rx "database del AMPUSER $17$Users/followme/grptime          "
   asterisk -rx "database del AMPUSER $17$Users/followme/postdest         "
   asterisk -rx "database del AMPUSER $17$Users/followme/prering          "
   asterisk -rx "database del AMPUSER $17$Users/followme/remotealertmsg   "
   asterisk -rx "database del AMPUSER $17$Users/followme/ringing          "
   asterisk -rx "database del AMPUSER $17$Users/followme/rvolume          "
   asterisk -rx "database del AMPUSER $17$Users/followme/strategy          "
   asterisk -rx "database del AMPUSER $17$Users/followme/toolatemsg        "
   asterisk -rx "database del AMPUSER $17$Users/hint                   "
   asterisk -rx "database del AMPUSER $17$Users/intercom                           "
   asterisk -rx "database del AMPUSER $17$Users/intercom/override                  "
   asterisk -rx "database del AMPUSER $17$Users/language                          "
   asterisk -rx "database del AMPUSER $17$Users/noanswer                          "
   asterisk -rx "database del AMPUSER $17$Users/outboundcid                        "
   asterisk -rx "database del AMPUSER $17$Users/password                          "
   asterisk -rx "database del AMPUSER $17$Users/queues/qnostate                    "
   asterisk -rx "database del AMPUSER $17$Users/recording                          "
   asterisk -rx "database del AMPUSER $17$Users/recording/in/external              "
   asterisk -rx "database del AMPUSER $17$Users/recording/in/internal              "
   asterisk -rx "database del AMPUSER $17$Users/recording/ondemand                 "
   asterisk -rx "database del AMPUSER $17$Users/recording/out/external             "
   asterisk -rx "database del AMPUSER $17$Users/recording/out/internal             "
   asterisk -rx "database del AMPUSER $17$Users/recording/priority                 "
   asterisk -rx "database del AMPUSER $17$Users/ringtimer                          "
   asterisk -rx "database del AMPUSER $17$Users/rvolume "
   asterisk -rx "database del AMPUSER $17$Users/voicemail                      "
   
   asterisk -rx "database del CALLTRACE $17$Users                          "
   asterisk -rx "database del CW $17$Users                         "
   asterisk -rx "database del CustomDevstate FOLLOWME$17$Users    "
   asterisk -rx "database del DEVICE  $17$Users/default_user      "
   asterisk -rx "database del DEVICE  $17$Users/dial "
   asterisk -rx "database del DEVICE  $17$Users/tech "
   asterisk -rx "database del DEVICE  $17$Users/type "
   asterisk -rx "database del DEVICE  $17$Users/user "
   
   
   
   
   asterisk -rx "database del QPENALTY  $12$Users/dynmemberonly "
   
   Us=$Us+1
   done
   
   
   
   exit
   
   
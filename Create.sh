#!/bin/bash


AsterDir=/etc/asterisk


PJS=pjsip_custom.conf
PJAOR=pjsip.aor_custom.conf #Address of Record  -Enddpoint
PJI=pjsip.identify_custom.conf
PJAU=pjsip.auth_custom.conf  ;
PJEND=pjsip.endpoint_custom.conf
Q=queues_custom.conf  ;
EXT=extensions_custom.conf  
SubNet=$1   #// nomer podseti 

declare -i Us=$2;  #// Start namber
declare -i cnt=$3   #// Kolichestvo nomerov

#Очистка всех файлов 
echo " " >  $AsterDir/$EXT
echo " " >  $AsterDir/$PJS
echo " " >  $AsterDir/$PJAOR
echo " " >  $AsterDir/$PJAU
echo " " >  $AsterDir/$PJEND
echo " " >  $AsterDir/$Q
echo " " >  $AsterDir/extensions_override_freepbx.conf

# Добавление данных в  DB

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

asterisk -rx "database put AMPUSER $10$Users/answermode 		disabled"
asterisk -rx "database put AMPUSER $10$Users/cfringtimer 		0"
asterisk -rx "database put AMPUSER $10$Users/cidname      		 $Us"
asterisk -rx "database put AMPUSER $10$Users/cidnum  			 $10$Users"
asterisk -rx "database put AMPUSER $10$Users/concurrency_limit                  3"
asterisk -rx "database put AMPUSER $10$Users/cwtone                             disabled"
asterisk -rx "database put AMPUSER $10$Users/device                             $10$Users"
asterisk -rx "database put AMPUSER $10$Users/dictate/email non"
asterisk -rx "database put AMPUSER $10$Users/dictate/enabled                    disabled"
asterisk -rx "database put AMPUSER $10$Users/dictate/format                     ogg"
asterisk -rx "database put AMPUSER $10$Users/dictate/from                       ZGljdGF0ZUBmcmVlcGJ4Lm9yZw=="
asterisk -rx "database put AMPUSER $10$Users/followme/annmsg       null"
asterisk -rx "database put AMPUSER $10$Users/followme/changecid                 default"
asterisk -rx "database put AMPUSER $10$Users/followme/ddial                     EXTENSION"
asterisk -rx "database put AMPUSER $10$Users/followme/dring       null             "
asterisk -rx "database put AMPUSER $10$Users/followme/fixedcid  null               "
asterisk -rx "database put AMPUSER $10$Users/followme/grpconf                   DISABLED"
asterisk -rx "database put AMPUSER $10$Users/followme/grplist                   $10$Users"
asterisk -rx "database put AMPUSER $10$Users/followme/grppre         null          "
asterisk -rx "database put AMPUSER $10$Users/followme/grptime                   20"
asterisk -rx "database put AMPUSER $10$Users/followme/postdest                  ext-local,$10$Users,dest"
asterisk -rx "database put AMPUSER $10$Users/followme/prering                   7"
asterisk -rx "database put AMPUSER $10$Users/followme/remotealertmsg  null         "
asterisk -rx "database put AMPUSER $10$Users/followme/ringing                   Ring"
asterisk -rx "database put AMPUSER $10$Users/followme/rvolume     null            "
asterisk -rx "database put AMPUSER $10$Users/followme/strategy                  ringallv2-prim"
asterisk -rx "database put AMPUSER $10$Users/followme/toolatemsg    null           "
asterisk -rx "database put AMPUSER $10$Users/hint                               PJSIP/$10$Users&Custom:DND$10$Users,CustomPresence:$10$Users "
asterisk -rx "database put AMPUSER $10$Users/intercom                           enabled"
asterisk -rx "database put AMPUSER $10$Users/intercom/override                  reject"
asterisk -rx "database put AMPUSER $10$Users/language                null          "
asterisk -rx "database put AMPUSER $10$Users/noanswer              null           "
asterisk -rx "database put AMPUSER $10$Users/outboundcid                        $10$Users"
asterisk -rx "database put AMPUSER $10$Users/password                 null         "
asterisk -rx "database put AMPUSER $10$Users/queues/qnostate                    usestate"
asterisk -rx "database put AMPUSER $10$Users/recording                 null         "
asterisk -rx "database put AMPUSER $10$Users/recording/in/external              dontcare"
asterisk -rx "database put AMPUSER $10$Users/recording/in/internal              dontcare"
asterisk -rx "database put AMPUSER $10$Users/recording/ondemand                 disabled"
asterisk -rx "database put AMPUSER $10$Users/recording/out/external             dontcare"
asterisk -rx "database put AMPUSER $10$Users/recording/out/internal             dontcare"
asterisk -rx "database put AMPUSER $10$Users/recording/priority                 10"
asterisk -rx "database put AMPUSER $10$Users/ringtimer                          0"
asterisk -rx "database put AMPUSER $10$Users/rvolume 				null "
asterisk -rx "database put AMPUSER $10$Users/voicemail                          novm"

asterisk -rx "database put CALLTRACE $10$Users                          $10$Users"

asterisk -rx "database put CW $10$Users                          ENABLED"
asterisk -rx "database put CustomDevstate FOLLOWME$10$Users    NOT_INUSE"
asterisk -rx "database put DEVICE $10$Users/default_user                    $10$Users"
asterisk -rx "database put DEVICE $10$Users/dial PJSIP/$10$Users "
asterisk -rx "database put DEVICE $10$Users/tech pjsip"
asterisk -rx "database put DEVICE $10$Users/type fixed"
asterisk -rx "database put DEVICE $10$Users/user   $10$Users "
asterisk -rx "database put QPENALTY  $12$Users/dynmemberonly no" 
#---- 

#--- 

asterisk -rx "database put AMPUSER $171$Users/answermode 		disabled"
asterisk -rx "database put AMPUSER $17$Users/cfringtimer 		0"
asterisk -rx "database put AMPUSER $17$Users/cidname      		 $Us"
asterisk -rx "database put AMPUSER $17$Users/cidnum  			 $17$Users"
asterisk -rx "database put AMPUSER $17$Users/concurrency_limit                  3"
asterisk -rx "database put AMPUSER $17$Users/cwtone                             disabled"
asterisk -rx "database put AMPUSER $17$Users/device                             $17$Users"
asterisk -rx "database put AMPUSER $17$Users/dictate/email non"
asterisk -rx "database put AMPUSER $17$Users/dictate/enabled                    disabled"
asterisk -rx "database put AMPUSER $17$Users/dictate/format                     ogg"
asterisk -rx "database put AMPUSER $17$Users/dictate/from                       ZGljdGF0ZUBmcmVlcGJ4Lm9yZw=="
asterisk -rx "database put AMPUSER $17$Users/followme/annmsg       null"
asterisk -rx "database put AMPUSER $17$Users/followme/changecid                 default"
asterisk -rx "database put AMPUSER $17$Users/followme/ddial                     EXTENSION"
asterisk -rx "database put AMPUSER $17$Users/followme/dring       null             "
asterisk -rx "database put AMPUSER $17$Users/followme/fixedcid  null               "
asterisk -rx "database put AMPUSER $17$Users/followme/grpconf                   DISABLED"
asterisk -rx "database put AMPUSER $17$Users/followme/grplist                   $17$Users"
asterisk -rx "database put AMPUSER $17$Users/followme/grppre         null          "
asterisk -rx "database put AMPUSER $17$Users/followme/grptime                   20"
asterisk -rx "database put AMPUSER $17$Users/followme/postdest                  ext-local,$17$Users,dest"
asterisk -rx "database put AMPUSER $17$Users/followme/prering                   7"
asterisk -rx "database put AMPUSER $17$Users/followme/remotealertmsg  null         "
asterisk -rx "database put AMPUSER $17$Users/followme/ringing                   Ring"
asterisk -rx "database put AMPUSER $17$Users/followme/rvolume     null            "
asterisk -rx "database put AMPUSER $17$Users/followme/strategy                  ringallv2-prim"
asterisk -rx "database put AMPUSER $17$Users/followme/toolatemsg    null           "
asterisk -rx "database put AMPUSER $17$Users/hint                               PJSIP/$17$Users&Custom:DND$17$Users,CustomPresence:$17$Users "
asterisk -rx "database put AMPUSER $17$Users/intercom                           enabled"
asterisk -rx "database put AMPUSER $17$Users/intercom/override                  reject"
asterisk -rx "database put AMPUSER $17$Users/language                null          "
asterisk -rx "database put AMPUSER $17$Users/noanswer              null           "
asterisk -rx "database put AMPUSER $17$Users/outboundcid                        $17$Users"
asterisk -rx "database put AMPUSER $17$Users/password                 null         "
asterisk -rx "database put AMPUSER $17$Users/queues/qnostate                    usestate"
asterisk -rx "database put AMPUSER $17$Users/recording                 null         "
asterisk -rx "database put AMPUSER $17$Users/recording/in/external              dontcare"
asterisk -rx "database put AMPUSER $17$Users/recording/in/internal              dontcare"
asterisk -rx "database put AMPUSER $17$Users/recording/ondemand                 disabled"
asterisk -rx "database put AMPUSER $17$Users/recording/out/external             dontcare"
asterisk -rx "database put AMPUSER $17$Users/recording/out/internal             dontcare"
asterisk -rx "database put AMPUSER $17$Users/recording/priority                 10"
asterisk -rx "database put AMPUSER $17$Users/ringtimer                          0"
asterisk -rx "database put AMPUSER $17$Users/rvolume 				null "
asterisk -rx "database put AMPUSER $17$Users/voicemail                          novm"

asterisk -rx "database put CALLTRACE $17$Users                          $17$Users"

asterisk -rx "database put CW $17$Users                          ENABLED"
asterisk -rx "database put CustomDevstate FOLLOWME$17$Users    NOT_INUSE"
asterisk -rx "database put DEVICE $17$Users/default_user                    $17$Users"
asterisk -rx "database put DEVICE $17$Users/dial PJSIP/$17$Users "
asterisk -rx "database put DEVICE $17$Users/tech pjsip"
asterisk -rx "database put DEVICE $17$Users/type fixed"
asterisk -rx "database put DEVICE $17$Users/user  $17$Users "


Us=$Us+1
done



declare -i Us=$2;
echo "Work Dialplan- [from-queue] extensions_override_freepbx.conf "
echo " " >>  $AsterDir/extensions_override_freepbx.conf
echo "[from-queue]" >>  $AsterDir/extensions_override_freepbx.conf
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

echo  "exten => $12$Users ,1,Goto(from-queue-exten-only,\${QAGENT},1)" >>  $AsterDir/extensions_override_freepbx.conf

Us=$Us+1
done
echo " " >>  $AsterDir/extensions_override_freepbx.conf

sed  ' '  test4 >> /etc/asterisk/extensions_override_freepbx.conf


#-----------------------------------------------------------------

# Создание диалплана очередей

declare -i Us=$2;

echo "Work Dialplan [ext-queues-custom]"
echo " " >>  $AsterDir/$EXT
echo "[ext-queues-custom]" >>  $AsterDir/$EXT
echo " " >> $AsterDir/$EXT


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

echo " " >>  $AsterDir/$EXT
sed  ' '  test3 >> /etc/asterisk/extensions_custom.conf
sed -i 's/RRRRR/'$12$Users'/g' /etc/asterisk/extensions_custom.conf


echo "Work Dialplan [ext-queues-custom]-$Us"

Us=$Us+1
done
sed  ' '  test5 >> /etc/asterisk/extensions_custom.conf







# Создание диалплана звонков 

echo "Work Dialplan - [ext-local-custom]"
echo " " >>  $AsterDir/$EXT
echo "[ext-local-custom]" >>  $AsterDir/$EXT
echo " " >>  $AsterDir/$EXT
declare -i Us=$2;

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


# Создание диалплана 
echo " " >>  $AsterDir/$EXT

sed  ' '  test >> /etc/asterisk/extensions_custom.conf
sed  ' '  test1 >> /etc/asterisk/extensions_custom.conf
sed  ' '  test2 >> /etc/asterisk/extensions_custom.conf

sed -i 's/VVVVV/'$10$Users'/g' /etc/asterisk/extensions_custom.conf
sed -i 's/RRRRR/'$12$Users'/g' /etc/asterisk/extensions_custom.conf

echo " " >>  $AsterDir/$EXT
sed  ' '  test >> /etc/asterisk/extensions_custom.conf
# sed  ' '  test1 >> /etc/asterisk/extensions_custom.conf
sed  ' '  test2 >> /etc/asterisk/extensions_custom.conf

sed -i 's/VVVVV/'$17$Users'/g' /etc/asterisk/extensions_custom.conf
sed -i 's/RRRRR/'$12$Users'/g' /etc/asterisk/extensions_custom.conf




echo " " >>  $AsterDir/$EXT
echo "Work Dialplan - [ext-local-custom]-$Users"
Us=$Us+1
done




declare -i Us=$2;
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


echo "Work PJEND - $Users"
echo " " >>  $AsterDir/$PJEND
echo ";Указатель для Endpoint " >>  $AsterDir/PJEND
echo "[$10$Users]" >>  $AsterDir/$PJEND

echo type=endpoint  >>  $AsterDir/$PJEND
echo aors=$10$Users  >>  $AsterDir/$PJEND
echo auth=$10$Users-auth  >>  $AsterDir/$PJEND
echo tos_audio=ef  >>  $AsterDir/$PJEND
echo tos_video=af41  >>  $AsterDir/$PJEND
echo cos_audio=5  >>  $AsterDir/$PJEND
echo cos_video=4  >>  $AsterDir/$PJEND
echo allow=ulaw,alaw,h264,h263p>>  $AsterDir/$PJEND
echo context=from-internal >>  $AsterDir/$PJEND
echo "callerid=<$10$Users>"  >>  $AsterDir/$PJEND
echo dtmf_mode=rfc4733 >>  $AsterDir/$PJEND
echo direct_media=no >>  $AsterDir/$PJEND
#echo aggregate_mwi=yes >>  $AsterDir/$PJEND
#echo use_avpf=no >>  $AsterDir/$PJEND
#echo rtcp_mux=no >>  $AsterDir/$PJEND
#echo max_audio_streams=1 >>  $AsterDir/$PJEND
#echo max_video_streams=1 >>  $AsterDir/$PJEND
#echo bundle=no >>  $AsterDir/$PJEND
#echo ice_support=no >>  $AsterDir/$PJEND
echo media_use_received_transport=no >>  $AsterDir/$PJEND
#echo trust_id_inbound=yes >>  $AsterDir/$PJEND
#echo user_eq_phone=no >>  $AsterDir/$PJEND
#echo send_connected_line=yes >>  $AsterDir/$PJEND
#echo media_encryption=no >>  $AsterDir/$PJEND
#echo timers=yes >>  $AsterDir/$PJEND
#echo timers_min_se=90 >>  $AsterDir/$PJEND
#echo media_encryption_optimistic=no >>  $AsterDir/$PJEND
#echo refer_blind_progress=yes >>  $AsterDir/$PJEND
#echo refer_blind_progress=yes >>  $AsterDir/$PJEND
#echo rtp_timeout=30 >>  $AsterDir/$PJEND
#echo rtp_timeout_hold=300 >>  $AsterDir/$PJEND
#echo send_pai=yes >>  $AsterDir/$PJEND
#echo rtp_symmetric=yes >>  $AsterDir/$PJEND
#echo rewrite_contact=yes >>  $AsterDir/$PJEND
#echo force_rport=yes >>  $AsterDir/$PJEND
echo language=ru >>  $AsterDir/$PJEND
#echo one_touch_recording=on >>  $AsterDir/$PJEND
#echo record_on_feature=apprecord >>  $AsterDir/$PJEND
#echo record_off_feature=apprecord >>  $AsterDir/$PJEND


echo "Work PJAOR - $Users"
echo " " >>  $AsterDir/$PJAOR
echo ";Указатель для Endpoint " >>  $AsterDir/$PJAOR
echo "[$10$Users]" >>  $AsterDir/$PJAOR
echo type=aor >>  $AsterDir/$PJAOR
echo max_contacts=1 >>  $AsterDir/$PJAOR
echo remove_existing=yes >>  $AsterDir/$PJAOR
echo maximum_expiration=7200 >>  $AsterDir/$PJAOR
echo minimum_expiration=60 >>  $AsterDir/$PJAOR
echo qualify_frequency=60 >>  $AsterDir/$PJAOR


echo "Work PJAU- $Users"
# Создание PJPS клиента 
echo " " >>  $AsterDir/$PJAU
echo ";Раздел авторизации " >>  $AsterDir/$PJAU
echo "[$10$Users-auth]" >>  $AsterDir/$PJAU
echo type=auth >>  $AsterDir/$PJAU
echo auth_type=userpass >>  $AsterDir/$PJAU
#echo password=12345678 >>  $AsterDir/$PJAU
echo username=$10$Users >>  $AsterDir/$PJAU
echo password=BitRuSip >>  $AsterDir/$PJAU




echo "Work PJEND - $Users"
echo " " >>  $AsterDir/$PJEND
echo ";Указатель для Endpoint " >>  $AsterDir/PJEND
echo "[$17$Users]" >>  $AsterDir/$PJEND

echo type=endpoint  >>  $AsterDir/$PJEND
echo aors=$17$Users  >>  $AsterDir/$PJEND
echo auth=$17$Users-auth  >>  $AsterDir/$PJEND
echo tos_audio=ef  >>  $AsterDir/$PJEND
echo tos_video=af41  >>  $AsterDir/$PJEND
echo allow=ulaw,alaw,h264,h263p >>  $AsterDir/$PJEND
echo context=from-internal >>  $AsterDir/$PJEND
echo "callerid=<$17$Users>"  >>  $AsterDir/$PJEND
#echo dtmf_mode=rfc4733 >>  $AsterDir/$PJEND
echo direct_media=no >>  $AsterDir/$PJEND
#echo aggregate_mwi=yes >>  $AsterDir/$PJEND
#echo use_avpf=no >>  $AsterDir/$PJEND
#echo rtcp_mux=no >>  $AsterDir/$PJEND
#echo max_audio_streams=1 >>  $AsterDir/$PJEND
#echo max_video_streams=1 >>  $AsterDir/$PJEND
#echo bundle=no >>  $AsterDir/$PJEND
#echo ice_support=no >>  $AsterDir/$PJEND
echo media_use_received_transport=no >>  $AsterDir/$PJEND
#echo trust_id_inbound=yes >>  $AsterDir/$PJEND
#echo user_eq_phone=no >>  $AsterDir/$PJEND
#echo send_connected_line=yes >>  $AsterDir/$PJEND
#echo media_encryption=no >>  $AsterDir/$PJEND
#echo timers=yes >>  $AsterDir/$PJEND
#echo timers_min_se=90 >>  $AsterDir/$PJEND
#echo media_encryption_optimistic=no >>  $AsterDir/$PJEND
#echo refer_blind_progress=yes >>  $AsterDir/$PJEND
#echo refer_blind_progress=yes >>  $AsterDir/$PJEND
#echo rtp_timeout=30 >>  $AsterDir/$PJEND
#echo rtp_timeout_hold=300 >>  $AsterDir/$PJEND
#echo send_pai=yes >>  $AsterDir/$PJEND
#echo rtp_symmetric=yes >>  $AsterDir/$PJEND
#echo rewrite_contact=yes >>  $AsterDir/$PJEND
#echo force_rport=yes >>  $AsterDir/$PJEND
echo language=ru >>  $AsterDir/$PJEND
#echo one_touch_recording=on >>  $AsterDir/$PJEND
#echo record_on_feature=apprecord >>  $AsterDir/$PJEND
#echo record_off_feature=apprecord >>  $AsterDir/$PJEND


echo "Work PJAOR - $Users"
echo " " >>  $AsterDir/$PJAOR
echo ";Указатель для Endpoint " >>  $AsterDir/$PJAOR
echo "[$17$Users]" >>  $AsterDir/$PJAOR
echo type=aor >>  $AsterDir/$PJAOR
echo max_contacts=1 >>  $AsterDir/$PJAOR
echo remove_existing=yes >>  $AsterDir/$PJAOR
echo maximum_expiration=7200 >>  $AsterDir/$PJAOR
echo minimum_expiration=60 >>  $AsterDir/$PJAOR
echo qualify_frequency=60 >>  $AsterDir/$PJAOR


echo "Work PJAU- $Users"
# Создание PJPS клиента 
echo " " >>  $AsterDir/$PJAU
echo ";Раздел авторизации " >>  $AsterDir/$PJAU
echo "[$17$Users-auth]" >>  $AsterDir/$PJAU
echo type=auth >>  $AsterDir/$PJAU
echo auth_type=userpass >>  $AsterDir/$PJAU
echo password=BitRuSip >>  $AsterDir/$PJAU
echo username=$17$Users >>  $AsterDir/$PJAU



#Создание очереди 

echo "Work Q- $Users"
echo " " >>  $AsterDir/$Q
echo ";Новая очередь " >>  $AsterDir/$Q
echo "[$12$Users]" >>  $AsterDir/$Q
echo announce-frequency=0 >>  $AsterDir/$Q
echo announce-holdtime=no >>  $AsterDir/$Q
echo announce-position=no >>  $AsterDir/$Q
echo autofill=no >>  $AsterDir/$Q
echo autopause=no >>  $AsterDir/$Q
echo autopausebusy=no >>  $AsterDir/$Q
echo autopausedelay=0 >>  $AsterDir/$Q
echo autopauseunavail=no >>  $AsterDir/$Q
echo joinempty=yes >>  $AsterDir/$Q
echo leavewhenempty=no >>  $AsterDir/$Q
echo maxlen=0 >>  $AsterDir/$Q
echo memberdelay=0 >>  $AsterDir/$Q
echo min-announce-frequency=15 >>  $AsterDir/$Q
echo penaltymemberslimit=0 >>  $AsterDir/$Q
echo periodic-announce-frequency=0 >>  $AsterDir/$Q
echo queue-callswaiting=silence/1 >>  $AsterDir/$Q
echo queue-thereare=silence/1 >>  $AsterDir/$Q
echo queue-youarenext=silence/1 >>  $AsterDir/$Q
echo reportholdtime=no >>  $AsterDir/$Q
echo retry=2 >>  $AsterDir/$Q
echo ringinuse=yes >>  $AsterDir/$Q
echo servicelevel=60 >>  $AsterDir/$Q
echo setinterfacevar=yes >>  $AsterDir/$Q
echo strategy=ringall >>  $AsterDir/$Q
echo timeout=10 >>  $AsterDir/$Q
echo timeoutpriority=app >>  $AsterDir/$Q
echo timeoutrestart=no >>  $AsterDir/$Q
echo weight=0 >>  $AsterDir/$Q
echo wrapuptime=0 >>  $AsterDir/$Q
echo context= >>  $AsterDir/$Q
echo member=Local/"$10$Users"@from-queue/n,0,"$Users",hint:"$10$Users"@ext-local >>  $AsterDir/$Q
echo member=Local/"$17$Users"@from-queue/n,0,"$Users",hint:"$17$Users"@ext-local >>  $AsterDir/$Q

Us=$Us+1
done

asterisk -rx "core restart now"
#asterisk -rx "pjsip reload"
#asterisk -rx dialplan reload



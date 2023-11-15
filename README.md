test1
Убрана строка :
exten => VVVVV,n,GotoIf($["${DIALSTATUS}"="NOANSWER"]?ext-queues-custom,RRRRR,1) # вызываем очередь в случае не ответа .


Script0.3.sh

В очередях в качестве агентов используеться оба номера .

echo member=Local/"$10$Users"@from-queue/n,0,"$Users",hint:"$10$Users"@ext-local >>  $AsterDir/$Q
echo member=Local/"$17$Users"@from-queue/n,0,"$Users",hint:"$17$Users"@ext-local >>  $AsterDir/$Q

Убранн заход в очередь у телефонных трубок .

# sed  ' '  test1 >> /etc/asterisk/extensions_custom.conf
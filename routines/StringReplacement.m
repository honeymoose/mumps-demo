 ;https://www.isharkfly.com/t/mumps-string-replacement/15228/1N I
 READ !,"Enter String:", address
 READ !,"Old String:", old
 READ !,"New String:", new
 DO strReplace(address,old,new,.count)
 WRITE !, count
 QUIT
strReplace(str,old,new,count)
 SET count=0
 SET position=0

 FOR {
    SET position=$FIND(str, old, position)
    QUIT:position=0
    SET count=count+1
    SET position=position
 }

 WRITE !,count
 SET str = $replace(str,old, new)
 WRITE !, str
 QUIT

 ; https://www.isharkfly.com/t/mumps-sorting-names/15225
 new name
 set name=$$getName()
 if name="" quit
 write !,"You entered: ",name
 DO validateAndAddName(name, .nameAry)
  set name=""
 f  s name=$O(nameAry(name)) q:name=""  w !,nameAry(name)
 quit
validateAndAddName(name,nameAry)
 SET nameAry(0)=name
getName() new name,done,error
 for  read !,"Enter a name (LAST,FIRST MI):",name quit:name=""  do  quit:done
 . set done=$$isValidName(.name,.error)
 . if 'done write !,error
 quit name
isValidName(name,error)
 set name=$$up(name)
 if name'?1.U1",".1" "1.U.1(1" "1U) set error="Invalid name" quit 0
 quit 1
 ;validateAndAddName(name,nameAry)
up(str)
 quit $TRANSLATE(str,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")

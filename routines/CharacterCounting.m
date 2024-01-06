 ; https://www.isharkfly.com/t/mumps-character-counting/15224
 SET array("a")="adsakljasdira"
 SET array("D")="DDD"
 DO countCharsInAry(.array, .countByChar)
 set name=""
 f  s name=$O(countByChar(name)) q:name=""  w !,countByChar(name)
 QUIT
countCharsInAry(ary,countByChar)
 SET name=""
 FOR  SET name=$O(ary(name)) QUIT:name=""  DO  SET countByChar(name)=$$getCount(ary(name),name)
 QUIT
getCount(str,subStr)
 SET count=0
 SET position=0

 FOR {
    SET position=$FIND(str, subStr, position)
    QUIT:position=0
    SET count=count+1
    SET position=position
 }

 QUIT count

 ; https://www.isharkfly.com/t/mumps-character-counting/15224
 SET ary("1")="abcabc a"
 SET ary("10")="abcabc aba"
 ;SET ary("11")="abcabc aba"

 DO countCharsInAry(.ary, .countByChar)
 set name=""
 f  s name=$O(countByChar(name)) q:name=""  w !,name,">",countByChar(name)
 QUIT
countCharsInAry(ary,countByChar)
 S name=""
 FOR  SET name=$O(ary(name)) QUIT:name=""  D
 . W !,ary(name)
 . S countByChar=$$getCount(ary(name))
 Q
getCount(str)
 S countByChar=""
 SET totalChars = 0
 FOR charIndex = 1:1:$LENGTH(str) DO
 . S currentChar=""
 . S currentChar = $EXTRACT(str, charIndex)
 . W !,$DATA(countByChar(currentChar))
 . IF $DATA(countByChar(currentChar))'=1 DO
 . . SET countByChar(currentChar) = 1
 . ELSE  DO
 . . SET countByChar(currentChar) = countByChar(currentChar) + 1
 . SET totalChars = totalChars + 1
 q countByChar

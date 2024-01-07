 ; https://www.isharkfly.com/t/mumps-name-search/15226
  SET nameAry("ALGEBRA,B B")=1
  SET nameAry("ALGEBRA,B B")=1
  SET nameAry("LOB,B B")=1
  SET nameAry("LOBLAW,BOB B")=1
  SET nameAry("ZEBRA,B B")=1
  ;SET nameAry(3)="Tom"
  ;SET nameAry(4)="Carrie"
  ;SET nameAry(5)="Tomcat"
  ;SET nameAry ="t"
  S search="LOB"
  DO findNames(search,.nameAry,.matches)
  SET name=""
  ;f  s name=$O(array(name)) q:name=""  w !,array(name)
  f  s name=$O(matches(name)) q:name=""  w !,name
  QUIT
findNames(search,nameAry,matches)
 n name
 n matchCount
 S search=$$up(search)
 S name=""
 S matchCount=0
 FOR  SET name=$O(nameAry(name)) Q:name=""  D
 . If ($FIND($$up(name),search)>0) D
 . . S matches(name)=nameAry(name)
 . . S matchCount=matchCount+nameAry(name)
 w !,matchCount
 QUIT matchCount
up(str)
 QUIT $TRANSLATE(str,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")

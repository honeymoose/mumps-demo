 ; https://www.isharkfly.com/t/mumps-name-search/15226
  SET array(1)="Sally"
  SET array(2)="John"
  SET array(3)="Tom"
  SET array(4)="Carrie"
  SET array(5)="Tomcat"
  SET search ="t"
  DO findNames(search,.array,.matches)
  SET name=""
  ;f  s name=$O(array(name)) q:name=""  w !,array(name)
  f  s name=$O(matches(name)) q:name=""  w !,name
  QUIT
findNames(search,nameAry,matches)
 SET search=$$up(search)
 SET name=""
 FOR {
	 SET name=$O(nameAry(name))
	 QUIT:name=""
	 If ($FIND($$up(nameAry(name)),search)> 0) {
		 SET matches(nameAry(name))=nameAry(name)
	 }
  }
 QUIT
up(str)
 QUIT $TRANSLATE(str,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")

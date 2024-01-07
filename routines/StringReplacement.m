 ;https://www.isharkfly.com/t/mumps-string-replacement/15228/1N I
 N I
 N TOK
 N OSTR
 SET count=0
 F I=1:1:$L(str," ") S TOK=$P(str," ",I) S:TOK=old TOK=new S:TOK=new count=count+1 S OSTR=$G(OSTR)_" "_TOK
 QUIT $E(OSTR,2,$LENGTH(OSTR))

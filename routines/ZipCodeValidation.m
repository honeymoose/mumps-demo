 ; https://www.isharkfly.com/t/mumps-zip-code-validation/15227
 R !,"Enter Zip:", address
 D isValidZipCode(address,.error)
 W !,error
 Q
isValidZipCode(address,error)
 S address = $EXTRACT(address,$LENGTH(address)-4,$LENGTH(address))
 I (address'?5N) S error="error zip code"  q 0
 S error="" q 1

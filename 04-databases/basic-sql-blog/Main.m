
  zlink "routines/Category"
  zlink "routines/Comment"
  zlink "routines/Database"
  zlink "routines/Post"
  zlink "routines/User"

; create users

  s ok=$$set^User(1,"alice~password~alice-jones@no-reply.com~Alice Jones")
  s ok=$$set^User(2,"bob~password~bob-smith@no-reply.com~Bob Smith")

; create categories

  s ok=$$set^Category(1,"foo~Foo")
  s ok=$$set^Category(2,"bar~Bar")
  s ok=$$set^Category(3,"foobar~Foobar")

; create posts
;
; s ok=$$set^Post(1, ...
;                 ⮡ post id
; s ok=$$set^Post(1,1, ...
;                   ⮡ category id
; s ok=$$set^Post(1,1,1 ...
;                     ⮡ user id

  s ok=$$set^Post(1,1,1,"lorem-ipsum~Lorem ipsum~Lorem ipsum dolor sit amet, consectetuer adipiscing elit.")
  s ok=$$set^Post(2,1,1,"donec-pede-justo~Donec pede justo~Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.")
  s ok=$$set^Post(3,3,2,"curabitur-ullamcorper-ultricies~Curabitur ullamcorper ultricies~Curabitur ullamcorper ultricies nisi.")
  s ok=$$set^Post(4,3,2,"donec-vitae-sapien~Donec vitae sapien~Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.")

; create comments

  s ok=$$set^Comment(1,1,"This is awesome! Thank you.")
  s ok=$$set^Comment(2,2,"Thank you so much for sharing this.")

; fetch a category

  do fetch^Category(1,.data)
  w "Category fetched:",!
  w "description: ",data("description"),!

; fetch a post

  do fetch^Post(1,.data)
  w !,"Post fetched:",!
  w "slug: ",data("slug"),!
  w "title: ",data("title"),!
  w "description: ",data("description"),!

; fetch posts by category

  do fetchByCategory^Post(3,.data)
  w !,"Posts fetched by category:",!
  s lev1=""
  s lev2=""
  s lev3=""
  f  s lev1=$o(data(lev1)) q:lev1=""  d
  . f  s lev2=$o(data(lev1,lev2)) q:lev2=""  d
  . . f  s lev3=$o(data(lev1,lev2,lev3)) q:lev3=""  d
  . . . w data(lev1,lev2,lev3),!

; fetch posts by user

  do fetchByUser^Post(1,.data)
  w !,"Posts fetched by user:",!
  s lev1=""
  s lev2=""
  s lev3=""
  f  s lev1=$o(data(lev1)) q:lev1=""  d
  . f  s lev2=$o(data(lev1,lev2)) q:lev2=""  d
  . . f  s lev3=$o(data(lev1,lev2,lev3)) q:lev3=""  d
  . . . w data(lev1,lev2,lev3),!

; fetch a comment

  do fetch^Comment(1,.data)
  w !,"Comment fetched:",!
  w "description: ",data("description"),!

; drop database

  s ok=$$drop^Database()
  i ok=1 d
  . w !,"Database successfully dropped!",!
  e  d
  . w "Whoops! The database could not be dropped.",!

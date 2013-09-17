Meteor.startup ->
  Boards = new Meteor.Collection "Boards"
  fakeBoards = [
    positions:
      {a1: "wR",a2: "wP",a7: "bP",a8: "bR",b1: "wN",b2: "wP",b7: "bP",b8: "bN",c1: "wB",c2: "wP",c7: "bP",c8: "bB",d1: "wQ",d2: "wP",d5: "bP",d8: "bQ",e1: "wK",e4: "wP",e5: "bP",e8: "bK",f1: "wB",f2: "wP",f3: "wN",f7: "bP",f8: "bB",g2: "wP",g7: "bP",g8: "bN",h1: "wR",h2: "wP",h7: "bP",h8: "bR"}

  , positions:
      {a1: "wR",a2: "wP",a7: "bP",a8: "bR",b1: "wN",b2: "wP",b7: "bP",b8: "bN",c1: "wB",c2: "wP",c7: "bP",c8: "bB",d1: "wQ",d2: "wP",d5: "bP",d8: "bQ",e1: "wK",e4: "wP",e5: "bP",e8: "bK",f1: "wB",f2: "wP",f3: "wN",f7: "bP",f8: "bB",g2: "wP",g7: "bP",g8: "bN",h1: "wR",h2: "wP",h7: "bP",h8: "bR"}

  , positions:
      {a1: "wR",a2: "wP",a7: "bP",a8: "bR",b1: "wN",b2: "wP",b7: "bP",b8: "bN",c1: "wB",c2: "wP",c7: "bP",c8: "bB",d1: "wQ",d2: "wP",d5: "bP",d8: "bQ",e1: "wK",e4: "wP",e5: "bP",e8: "bK",f1: "wB",f2: "wP",f3: "wN",f7: "bP",f8: "bB",g2: "wP",g7: "bP",g8: "bN",h1: "wR",h2: "wP",h7: "bP",h8: "bR"}

  , positions:
      {a1: "wR",a2: "wP",a7: "bP",a8: "bR",b1: "wN",b2: "wP",b7: "bP",b8: "bN",c1: "wB",c2: "wP",c7: "bP",c8: "bB",d1: "wQ",d2: "wP",d5: "bP",d8: "bQ",e1: "wK",e4: "wP",e5: "bP",e8: "bK",f1: "wB",f2: "wP",f3: "wN",f7: "bP",f8: "bB",g2: "wP",g7: "bP",g8: "bN",h1: "wR",h2: "wP",h7: "bP",h8: "bR"}

  , positions:
      {a1: "wR",a2: "wP",a7: "bP",a8: "bR",b1: "wN",b2: "wP",b7: "bP",b8: "bN",c1: "wB",c2: "wP",c7: "bP",c8: "bB",d1: "wQ",d2: "wP",d5: "bP",d8: "bQ",e1: "wK",e4: "wP",e5: "bP",e8: "bK",f1: "wB",f2: "wP",f3: "wN",f7: "bP",f8: "bB",g2: "wP",g7: "bP",g8: "bN",h1: "wR",h2: "wP",h7: "bP",h8: "bR"}

  , positions:
      {a1: "wR",a2: "wP",a7: "bP",a8: "bR",b1: "wN",b2: "wP",b7: "bP",b8: "bN",c1: "wB",c2: "wP",c7: "bP",c8: "bB",d1: "wQ",d2: "wP",d5: "bP",d8: "bQ",e1: "wK",e4: "wP",e5: "bP",e8: "bK",f1: "wB",f2: "wP",f3: "wN",f7: "bP",f8: "bB",g2: "wP",g7: "bP",g8: "bN",h1: "wR",h2: "wP",h7: "bP",h8: "bR"}
  ]
  if Boards.find().length <= 0
    i = 0

    while i < fakeBoards.length
      Boards.insert fakeBoards[i]
      i++

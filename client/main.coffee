Meteor.startup ->
  Template.listOfBoards.boards = Boards.find().fetch()
  Template.listOfBoards.events
    "click button": ->
      Router.path "boardShow", board

  onChange = ->
    data = positions: board1.position()
    if not Session.get "board" or
      Boards.find(_id: Session.get "board").fetch().length is 0
      then Session.set "board", Boards.insert data
    else
      Boards.update
        _id: Session.get "board"
      ,
        $set:
          positions: board1.position()


  Router.map ->
    @route "home",
      path: "/"

    @route "showBoard",
      path: "/boards/:_id"
      controller: "BoardsController"
      action: "show"


  BoardsController = RouteController.extend

    template: "showBoard"
    data: ->
      Boards.findOne @params._id

    show: ->
      board1 = new ChessBoard "board1",
        draggable: true
        position: "start"
        onChange: onChange

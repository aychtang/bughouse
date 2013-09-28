Meteor.startup ->
  Template.listOfBoards.boards = Boards.find()
  Template.listOfBoards.events
    "click button": ->
      Router.path "boardShow", board
  Template.showBoard.rendered = ->
    board1 = new ChessBoard "board1",
      draggable: true
      position: "start"
      onChange: onChange

  onChange = ->
    data = positions: this.position()
    if not Session.get "board" or
      Boards.find(_id: Session.get "board").fetch().length is 0
      then Session.set "board", Boards.insert data
    else
      Boards.update
        _id: Session.get "board"
      ,
        $set:
          positions: this.position()


  Router.map ->
    @route "home",
      path: "/"

    @route "showBoard",
      path: "/boards/:_id"
      controller: "BoardsController"
      action: "show"


  window.BoardsController = RouteController.extend

    template: "showBoard"
    data: ->
      Boards.findOne @params._id

    show: ->
      @render()

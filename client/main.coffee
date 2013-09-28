Meteor.startup ->
  boardSubscription = null
  Meteor.autorun ->
    boardSubscription = Meteor.subscribe('Boards')
  somethingElse = null
  Template.listOfBoards.boards = Boards.find()
  Template.listOfBoards.events
    "click button": ->
      Router.path "boardShow", board
  Template.showBoard.rendered = ->
    Meteor.autorun ->
      if boardSubscription.ready()
        currentBoard = Boards.findOne({_id: Session.get "board"})
        somethingElse = new ChessBoard "board1",
          draggable: true
          position: currentBoard.positions
          onChange: onChange

  onChange = ->
    data = positions: somethingElse.position()
    console.log('onChange ran')
    if not Session.get "board" or Boards.find(_id: Session.get "board").fetch().length is 0
      currentBoard = Boards.insert data
      Session.set "board", currentBoard
    else
      console.log('update attempted')
      Boards.update
        _id: Session.get "board"
      ,
        $set:
          positions: somethingElse.position()


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
      currentBoard = @params._id
      Session.set 'board', currentBoard
      @render()

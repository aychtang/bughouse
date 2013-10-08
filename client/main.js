Meteor.startup(function() {

  var boardSubscription, onChange, somethingElse;
  boardSubscription = null;
  Meteor.autorun(function() {
    return boardSubscription = Meteor.subscribe('Boards');
  });
  somethingElse = null;
  Template.listOfBoards.boards = Boards.find();
  Template.listOfBoards.events({
    "click button": function() {
      return Router.path("boardShow", board);
    }
  });
  Template.showBoard.rendered = function() {
    return Meteor.autorun(function() {
      var currentBoard;
      if (boardSubscription.ready()) {
        currentBoard = Boards.findOne({
          _id: Session.get("board")
        });
        return somethingElse = new ChessBoard("board1", {
          draggable: true,
          position: currentBoard.positions,
          onChange: onChange
        });
      }
    });
  };
  onChange = function() {
    var currentBoard, data;
    data = {
      positions: somethingElse.position()
    };
    console.log('onChange ran');
    if (!Session.get("board" || Boards.find({
      _id: Session.get("board")
    }).fetch().length === 0)) {
      currentBoard = Boards.insert(data);
      return Session.set("board", currentBoard);
    } else {
      console.log('update attempted');
      return Boards.update({
        _id: Session.get("board")
      }, {
        $set: {
          positions: somethingElse.position()
        }
      });
    }
  };
  Router.map(function() {
    this.route("home", {
      path: "/"
    });
    return this.route("showBoard", {
      path: "/boards/:_id",
      controller: "BoardsController",
      action: "show"
    });
  });
  return window.BoardsController = RouteController.extend({
    template: "showBoard",
    data: function() {
      return Boards.findOne(this.params._id);
    },
    show: function() {
      var currentBoard;
      currentBoard = this.params._id;
      Session.set('board', currentBoard);
      return this.render();
    }
  });
});

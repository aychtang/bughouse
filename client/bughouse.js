Meteor.startup(function() {
	Template.listOfBoards.boards = Boards.find().fetch();
	Template.listOfBoards.events({
		"click button": function () {
			Router.path('boardShow', board);
		}
	});

	var onChange = function() {
		var data = {
			positions: board1.position()
		};

		if (!Session.get('board') || Boards.find({_id: Session.get('board')}).fetch().length === 0) {
			Session.set('board', Boards.insert(data));
		} else {
			Boards.update({
				_id: Session.get('board')
			},
			{
				$set: {
					positions: board1.position()
				}
			});
		}
	};


	Router.map(function(){
		this.route('home', {path: '/'});

	  this.route('showBoard',{
	    path: '/boards/:_id',
	    controller: 'BoardsController',
	    action: 'show'
	  });
	});

	BoardsController = RouteController.extend({
		template: 'showBoard',

		data: function() {
			return Boards.findOne(this.params._id);
		},
		show: function() {
			var board1 = new ChessBoard('board1', {
				draggable: true,
				position: 'start',
				onChange: onChange
			});
		}
	})
});

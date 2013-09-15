Meteor.startup(function() {
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

	var board1 = new ChessBoard('board1', {
		draggable: true,
		position: 'start',
		onChange: onChange
	});
});


Meteor.startup(function() {
	var board1 = new ChessBoard('board1', {
		draggable: true,
		position: 'start'
	});
});
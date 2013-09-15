
Meteor.startup(function() {
	var onChange = function(oldPos, newPos) {
	  console.log("Position changed:");
	  console.log("Old position: " , ChessBoard.fenToObj(ChessBoard.objToFen(oldPos)));
	  console.log("New position: " , ChessBoard.fenToObj(ChessBoard.objToFen(newPos)));
	  console.log("--------------------");
	};

	var board1 = new ChessBoard('board1', {
		draggable: true,
		position: 'start',
		onChange: onChange
	});
});

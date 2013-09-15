Package.describe({
  summary: "Chessboard.js"
});


Package.on_use(function (api) {
  api.add_files('js/chessboard-0.3.0.min.js', ['client']);
  api.add_files('css/chessboard-0.3.0.min.css', ['client']);

  api.add_files('img/chesspieces/wikipedia/bB.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/bK.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/bN.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/bP.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/bQ.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/bR.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/wB.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/wK.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/wN.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/wP.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/wQ.png', ['client']);
  api.add_files('img/chesspieces/wikipedia/wR.png', ['client']);
});

Package.describe({
  summary: "Chessboard.js"
});


Package.on_use(function (api) {
  api.add_files('/packages/chessboardjs/js/chessboard-0.3.0.min.js', ['client', 'server']);
  api.add_files('/packages/chessboardjs/css/chessboard-0.3.0.min.css', ['client']);
});

Package.describe({
  summary: "Chessboard.js"
});


Package.on_use(function (api) {
  api.add_files('js/chessboard-0.3.0.min.js', ['client', 'server']);
  api.add_files('css/chessboard-0.3.0.min.css', ['client']);
});

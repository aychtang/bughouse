Package.describe({
  summary: "Chessboard.js"
});


Package.on_use(function (api) {
  api.add_files('js/chessboard-0.3.0.js', ['client']);
  api.add_files('css/chessboard-0.3.0.min.css', ['client']);
});

<!DOCTYPE html>
<html lang="en">
<head>
  <title>BFB Search</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}

    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }

    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;}
    }
  </style>
</head>
<body>



<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#"></a>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link" href="/">Search </a>
            <a class="nav-item nav-link" href="/result">All Cards</a>
            <a class="nav-item nav-link active" href="/upload">Upload Deck<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="/decks">View Decks</a>
            <a class="nav-item nav-link" href="/rules">Game Rules</a>
        </div>
    </div>
</nav>



<div class="container">
  <h2>Upload your decklist</h2>
  <p>This will most certantly get pissed and crash if you name your deck something that is already in use<p/>
  <form action="/upload" method="post">
    <div class="form-group">
      <label for="deck_name">Deck Name:</label>
      <input type="text" class="form-control" name="deck_name" placeholder="Enter deck name">
    </div>

    <div class="form-group">
      <label for="decklist">Put your deck list here with each cardname with each card on a seprate line, each line should have the quantity of that card and then a space followed by the cards name:</label>
      <p><textarea class="form-control" input type="text" placeholder="4 Pipe Bomb" name="decklist"></textarea></p>
      <p><input type="submit" name="upload" value="upload"></p>

    </div>
  </form>
</div>

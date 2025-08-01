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
            <a class="nav-item nav-link" href="/upload">Upload Deck</a>
            <a class="nav-item nav-link active" href="/decks">View Decks<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="/rules">Game Rules</a>
        </div>
    </div>
</nav>

 <!-- submit -->
<form action="/decks_result" method="post">


  <div class="form-group">
    <label for="deck_name_search">| Find a deck by entering its full name  </label>
    <input type="text" class="form-control" id="deck_name_search"  placeholder="", name="deck_name_search">
  </div>


  <button type="submit">Submit</button>
</form>




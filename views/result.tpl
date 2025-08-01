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
            <a class="nav-item nav-link active" href="/result">All Cards<span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="/upload">Upload Deck</a>
            <a class="nav-item nav-link" href="/decks">View Decks</a>
            <a class="nav-item nav-link" href="/rules">Game Rules</a>
            <a class="nav-item nav-link" href="/wife">wife</a>
        </div>
    </div>
</nav>



% rebase('base.tpl')
<table border="1">
  <thead>
    <tr>
      <th>Card Number</th>
      <th>Card Name</th>
      <th>Card Cost</th>
      <th>Strength</th>
      <th>Health</th>
      <th>duration</th>
      <th>starting power</th>
      <th>card text</th>
      <th>violet</th>
      <th>red</th>
      <th>keywords</th>
      <th>card type</th>
    </tr>
  </thead>
  <tbody>
    % for row in rows:
      <tr>
        <td>{{row[0]}}</td> 
        <td>{{row[1]}}</td>
        <td>{{row[2]}}</td> 
        <td>{{row[3]}}</td>
        <td>{{row[4]}}</td> 
        <td>{{row[11]}}</td> 
        <td>{{row[5]}}</td>
        <td>{{row[6]}}</td>
        <td>{{row[7]}}</td> 
        <td>{{row[8]}}</td>
        <td>{{row[9]}}</td>
        <td>{{row[10]}}</td>
      </tr>
    % end
  </tbody>
</table>
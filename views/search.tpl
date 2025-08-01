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
            <a class="nav-item nav-link active" href="/">Search <span class="sr-only">(current)</span></a>
            <a class="nav-item nav-link" href="/result">All Cards</a>
            <a class="nav-item nav-link" href="/upload">Upload Deck</a>
            <a class="nav-item nav-link" href="/decks">View Decks</a>
            <a class="nav-item nav-link" href="/rules">Game Rules</a>
        </div>
    </div>
</nav>

<form>


  
 

</form>



 <!-- submit -->
<form action="/result" method="post">


  <div class="form-group">
    <label for="card_name_has">| Card name contains </label>
    <input type="" class="form-control" id="card_name_has"  placeholder="", name="name_contains">
  </div>

  <div class="form-group">
    <label for="card_name_has">| Card text contains </label>
    <input type="" class="form-control" id="card_text_has"  placeholder="", name="text_contains">
  </div>


  <!-- cardtype -->
  <p class="text-left">| Filter for cards of only one type </p>
  <select class="form-control form-control-sm" name="cardtype">
    <option value="all">all</option>
    <option value="creature">creature</option>
    <option value="spell">spell</option>
    <option value="attachment">attachment</option>
    <option value="weather">weather</option>
    <option value="ancient evil">ancient evil</option>
  </select>


  <!-- violet -->
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="filter_violet">
    <label class="form-check-label" for="exampleCheck1">| Filter for violet</label>
  </div>


  <!-- red -->
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck2" name="filter_red">
    <label class="form-check-label" for="exampleCheck2">| Filter for red</label>
  </div>


<!-- cost filter  -->
 <div class="form-row align-items-end">
  <!-- cost filter type -->
  <div class="col-auto">
    <label for="relative_cost">| Cost filter</label>
    <select class="form-control form-control-sm" name="relative_cost" id="relative_cost">
      <option value=""></option>
      <option value="greater than">greater than</option>
      <option value="equal to">equal to</option>
      <option value="less than">less than</option>
    </select>
  </div>

  <!-- cost amount -->
  <div class="col-auto">
    <label for="cost"></label>
    <input type="number" class="form-control form-control-sm" id="amount_cost" name="amount_cost" placeholder="Enter cost">
  </div>
 </div>


<!-- strength filter  -->
 <div class="form-row align-items-end">
  <!-- strength filter type -->
  <div class="col-auto">
    <label for="relative_strength">| Strength filter</label>
    <select class="form-control form-control-sm" name="relative_strength" id="relative_strength">
      <option value=""></option>
      <option value="greater than">greater than</option>
      <option value="equal to">equal to</option>
      <option value="less than">less than</option>
    </select>
  </div>

  <!-- strength amount -->
  <div class="col-auto">
    <label for="strength"></label>
    <input type="number" class="form-control form-control-sm" id="amount_strength" name="amount_strength" placeholder="Enter strength">
  </div>
 </div>



<!-- health filter  -->
 <div class="form-row align-items-end">
  <!-- health filter type -->
  <div class="col-auto">
    <label for="relative_health">| Health filter</label>
    <select class="form-control form-control-sm" name="relative_health" id="relative_health">
      <option value=""></option>
      <option value="greater than">greater than</option>
      <option value="equal to">equal to</option>
      <option value="less than">less than</option>
    </select>
  </div>

  <!-- health amount -->
  <div class="col-auto">
    <label for="health"></label>
    <input type="number" class="form-control form-control-sm" id="amount_health" name="amount_health" placeholder="Enter health">
  </div>
 </div>





  <button type="submit">Submit</button>


</form>
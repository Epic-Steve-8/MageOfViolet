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
            <a class="nav-item nav-link" href="/decks">View Decks</a>
            <a class="nav-item nav-link active" href="/rules">Game Rules<span class="sr-only">(current)</span></a>
        </div>
    </div>
</nav>


<h1>Battle for Bajookieland</h1>

<h2>-&gt; Da Rules &lt;-</h2>

<h3>Start of the game</h3>
<p>Each player draws five cards, if they don't like their five cards they are free to mulligan (shuffle their hand back into their deck and draw again with one less card), and each player can mulligan once with no penalty. Everyone gets twenty health, a mana cap of one and one mana to start.</p>

<h3>Your Turn</h3>
<ul>
  <li>Set your mana equal to your mana cap at the start.</li>
  <li>You are free to draw a card per turn at any time from Main phase to End Phase.</li>
  <li>There is a max hand size of seven, you must discard if you ever have more cards than that.</li>
  <li>You can play as many cards as you want as long as you can afford them.</li>
  <li>Creatures cannot attack or use activated abilities on the same turn they are played, unless the card itself says otherwise (summoning sickness).</li>
  <li>Creature health is instantly restored after combat phase.</li>
  <li>Card types are detailed below. Important to remember, it's not mtg or hearthstone, creatures aren't spells.</li>
  <li>During your turn you can pay two of your mana cap to draw a card. This is referred to as "Burning Mana Cap".</li>
  <li>You can end your turn by doing nothing or attacking.</li>
</ul>

<h4>Phases</h4>
<ul>
  <li>Mana refill</li>
  <li>Start of turn abilities/Weather Effect Countdown/Untap all your cards</li>
  <li>Main phase, you can play every kind of card.</li>
  <li>Hunt Phase, creatures with hunt may attack here. From here on you can no longer play any cards that aren't spells.</li>
  <li>Combat Phase, you may attack multiple players at once</li>
  <li>End phase, one last chance to play spells.</li>
  <li>End of Turn</li>
</ul>

<h3>Not your turn</h3>
<ul>
  <li>Spells can be played at any time. Imagine every spell has the flash keyword from MTG.</li>
  <li>A creature must be untapped in order for it to block. Each creature can only block a single attacker, but multiple defending creatures can block the same attacker. The defending player decides which of their creatures receive damage first if blocking one attacking creature with multiple defending ones.</li>
  <li>Blocking doesn't tap your creatures.</li>
  <li>You cannot use abilities on tapped creatures</li>
</ul>

<h3>End of round</h3>
<p>After every player takes their turn, the round ends and everyone's mana cap is raised by one. Note that your mana itself doesn't instantly refill.</p>

<h3>Deck Building Rules</h3>
<p>Your deck must contain at least 40 total cards, with a maximum of 4 of the same card. You cannot include any token, boss, adventure, or pile mode cards in your deck itself (look for the number on the bottom right of the card). There is no upper limit on the number of cards in your deck but typically a smaller deck is more consistent.</p>

<h3>Card Types</h3>
<ul>
  <li><strong>Spells:</strong> They only have a cost in the top left, and can be played at any time.</li>
  <li><strong>Creatures:</strong> They have health and damage stats, can only be played on your turn.</li>
  <li><strong>Attachments:</strong> They have a sword and gun crossed on them, and can only be played on your turn. They also cannot be countered like a spell. When played they are attached to a creature of your choosing, and when that creature dies any cards attached to it are discarded, unless they have recyclable, in which case they declared floating.</li>
  <li><strong>Weather Effects:</strong> Weather effects are denoted by the clock icon on the card. They can only be played on your turn and if another weather effect is already in play remove it. At the start of the players turn who owns the weather effect, decrease its counter by one, when it hits zero discard it.</li>
  <li><strong>Ancient Evils:</strong> These cards have a skull on them, which contains their starting power on it. You may tap the Ancient Evil to activate one ability listed on the Evil per turn (And you can use one on the turn it is played) and it either gains or loses power based on the number next to the ability. Ancient Evils can be attacked and defended as though they were players, with their power serving as their health (They do no damage in return). Ancient Evils may not benefit from attachments, and you may only control one at a time (not one type, one in general. They are very needy).</li>
  <li><strong>Traps:</strong> Played face down, each one has a unique condition and effect. You may only activate one trap per condition. You do not pay the mana cost on these cards until they activate, if you don't have enough mana then you gain one copy of debt (T28) for each missing mana.</li>
  <li><strong>Advice:</strong> Specific to the Woundrous Wisdomball, when you include him in your deck bring the advice deck and the legendary deck as well. Advice cards stay until resolved, then are burned. Can't give the same advice twice per game. All players with the Wisdomball share one Advice deck.</li>
</ul>

<h3>Keywords</h3>
<ul>
  <li><strong>Blast:</strong> When this creature attacks or blocks, it deals blast damage to a target.</li>
  <li><strong>Bounce:</strong> Return a creature to its owner's hand, including attachments.</li>
  <li><strong>Burn:</strong> Deletes cards from the opponent when it deals damage.</li>
  <li><strong>Cryophilic:</strong> Immune to the freeze effect.</li>
  <li><strong>Deathtouch:</strong> Any damage is lethal to creatures.</li>
  <li><strong>Defensive:</strong> Cannot attack, negates several offensive keywords.</li>
  <li><strong>Double Strike:</strong> Deals combat damage twice if it survives the first exchange.</li>
  <li><strong>First Strike:</strong> Deals combat damage before non-first strike creatures.</li>
  <li><strong>Flying:</strong> Can only be blocked by creatures with Reach or Flying.</li>
  <li><strong>Freeze:</strong> Prevents untapping. Ancient Evils can be frozen.</li>
  <li><strong>Haste:</strong> Can attack or use abilities on the same turn it's played.</li>
  <li><strong>Hexproof:</strong> Immune to spells.</li>
  <li><strong>Horde:</strong> Creatures stack their stats/abilities.</li>
  <li><strong>Hunt:</strong> Targets specific creatures; can't be defended by extras.</li>
  <li><strong>Legion:</strong> Pay the cost repeatedly to summon multiple copies.</li>
  <li><strong>Lifesteal:</strong> Owner heals when damage is dealt.</li>
  <li><strong>Menace:</strong> Must be blocked by two or more creatures.</li>
  <li><strong>Multiblock:</strong> Can block two creatures. Counters Menace.</li>
  <li><strong>Peirce:</strong> Deals damage to all blockers and target.</li>
  <li><strong>Poison:</strong> Adds poison tokens which deal recurring damage.</li>
  <li><strong>Reach:</strong> Can block Flying creatures.</li>
  <li><strong>Recyclable:</strong> Attachment survives creature's death and floats.</li>
  <li><strong>Resurrect:</strong> Replay or replace a destroyed creature.</li>
  <li><strong>Stealth:</strong> Hidden like traps; untargetable until revealed.</li>
  <li><strong>Taunt:</strong> Forces blocks if any creatures are available to defend.</li>
  <li><strong>Trample:</strong> Excess damage hits the defending player.</li>
  <li><strong>Unaware:</strong> Can only be played/activated on your turn.</li>
  <li><strong>Vigilance:</strong> Does not tap when attacking.</li>
</ul>

<h4>Stacking Keywords</h4>
<p>Yes, some keywords can stack, here's how:</p>
<ul>
  <li>First Strike + First Strike = Firstest Strike (stacks infinitely)</li>
  <li>Poison 1 + Poison 2 = Two poison counters</li>
  <li>Burn 2 + Burn 3 = Burn 5</li>
  <li>Flying + Flying = Flying+, even harder to block</li>
  <li>Multiblock + Multiblock = Multiblock 2 (blocks 3 creatures)</li>
  <li>Blast 1 + Blast 1 = Two targets (same or different)</li>
  <li>Menace + Menace = Menace 2 (needs 3 blockers)</li>
  <li>Deathtouch + Trample = Trample passes excess after lethal to blockers</li>
  <li>Double Strike + Triple Strike = Quadruple Strike</li>
</ul>

<h2>-&gt; Adventure Mode &lt;-</h2>

<h3>How it works</h3>
<p>The adventure gets a "prep phase" where it does whatever is next on its action order and its universal actions, then players do their thing. Afterwards, combat happens all at once, with players choosing blockers (and attackers when relevant) all in one go. Then repeat, mana cap increases, yadayada. Players get a combined 30 health, and cannot heal above thirty health through any means. Players cannot include ancient evils in their decks.</p>

<h3>New Card Types</h3>
<ul>
  <li><strong>Sporls:</strong> Like spells, but cannot be countered.</li>
  <li><strong>Bosses:</strong> Creatures that take permanent damage, immune to destroy, treated as Ancient Evils.</li>
  <li><strong>Crossroads:</strong> Players vote; if tie and someone refuses, reduce their mana cap to zero and flip a coin.</li>
</ul>

<h2>-&gt; Boss Fights &lt;-</h2>

<p>Special 2v1 where the boss has a prebuilt deck with custom cards. Probably extremely unbalanced. The boss player always goes first, unless a very special ball has something to say about it.</p>
# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', new Game()
    # set an internal property of app to new Game object
    # call methods from the new game object on dealer hand and
    # player hand to make changes to the current game.
    @get 'playerHand'
      .on 'add', => @bustCheck('playerHand')

    @get 'game'
      .on 'playerHandbust', => alert('player bust'); @trigger('gameOver')

    @get 'game'
      .on 'dealerHandbust', => alert('dealer bust'); @trigger('gameOver')

    @get 'playerHand'
      .on 'add stand', => @get('game').dealerTurn(@get('dealerHand').dealerScores());

    @get 'game'
      .on 'hit', => @get('dealerHand').hit(); @bustCheck('dealerHand')

  bustCheck: (player) ->
    if player is 'playerHand' then @get('game').bust(@get(player).scores(), player) else @get('game').bust(@get(player).dealerScores(), player)

  winnerCheck: (playerScore, dealerScore) ->
    if playerScore > dealerScore
     alert 'Player Wins!'
    else if playerScore == dealerScore
      alert 'Push!'
    else alert 'Dealer Wins!'

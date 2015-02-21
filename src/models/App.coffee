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
      .on 'add', => @bustCheck()

  bustCheck: ->
    @get('game').bust(@get('playerHand').scores())




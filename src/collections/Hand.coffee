class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  stand: ->
    @trigger('stand', @)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  dealerMinScore: -> @reduce (score, card) ->
    score + card.get 'value'
  , 0

  dealerScores: ->
    scoresArray = [@dealerMinScore(), @dealerMinScore() + 10 * @hasAce()]
    if scoresArray.length == 2
      if scoresArray[0] > scoresArray[1] and scoresArray[0] <= 21
        scoresArray[0]
      else
        scoresArray[1]
    else
      scoresArray[0]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    scoresArray = [@minScore(), @minScore() + 10 * @hasAce()]
    if scoresArray.length == 2
      if scoresArray[0] > scoresArray[1] and scoresArray[0] <= 21
        scoresArray[0]
      else
        scoresArray[1]
    else
      scoresArray[0]



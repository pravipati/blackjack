class window.Game extends Backbone.Model

  bust: (scores, player)->
    if scores[0] > 21 and scores[1] > 21 then @trigger(player + 'bust', @)

  dealerTurn:(scores) ->
    if scores[0] < 17 and scores[1] < 17 then @trigger('hit', @)

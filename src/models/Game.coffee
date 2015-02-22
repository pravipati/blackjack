class window.Game extends Backbone.Model

  bust: (scores, player)->
    if scores > 21 then @trigger(player + 'bust', @)

  dealerTurn:(scores) ->
    if scores < 17 then @trigger('hit', @)



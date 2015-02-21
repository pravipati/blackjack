class window.Game extends Backbone.Model

  bust: (array)->
    if array[0] > 21 and array[1] > 21 then console.log('bust')



# @get 'playerHand'
    #   .on 'hit', => alert 'success!', @
    #

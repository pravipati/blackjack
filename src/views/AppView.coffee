class window.AppView extends Backbone.View
  template: _.template '
  <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
  <button class="reset-button">Reset</button> <button class="turnover-button">Turn Over</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>

  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .reset-button': -> @model.initialize(); @initialize()
    'click .turnover-button': -> @model.get('dealerHand').at(0).flip()

  initialize: ->
    @render()
    @model.on 'gameOver', => @.$('.stand-button, .hit-button').prop('disabled', true)
    @model.get('dealerHand').on('change:revealed', => @.$('.hit-button, .turnover-button, .stand-button').prop('disabled', true))
    @model.get('dealerHand').on('change:revealed', => @model.winnerCheck(@model.get('playerHand').scores(), @model.get('dealerHand').dealerScores()))




  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


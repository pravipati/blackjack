assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

describe 'hand', ->
  it('Hand should contain card models', ->
      assert(hand.at(0)).to.be.an.instanceof(Card)
    )


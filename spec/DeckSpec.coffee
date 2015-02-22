assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last().value, hand.hit().value
      assert.strictEqual deck.length, 49

  describe 'stand', ->
    it 'should not change number of cards in hand', ->
      assert.strictEqual hand.length, 2
      hand.stand()
      assert.strictEqual hand.length, 2



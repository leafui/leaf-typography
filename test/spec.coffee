expect = chai.expect
headings = null

describe('leaf-typography', ->
  describe('vertical rhythm', ->
    before(->
      headings = document.querySelectorAll('h1')
    )

    it('should keep a uniform vertical rhythm respecting line spacing', ->
      lineHeight = headings[0].getBoundingClientRect().top
      firstHeadingRect = headings[1].getBoundingClientRect()
      secondHeadingRect = headings[2].getBoundingClientRect()
      distance = secondHeadingRect.top - firstHeadingRect.height
      expect(Math.round(distance - lineHeight))
      .to.eql(Math.round(firstHeadingRect.top))
    )
  )
)

---
patterns:
  URI: '"(\/.*?)"'
  NUMBER: '"(\d+)"'
  SECONDS: '"(\d+)s"'
  VERB: "(?:And|Then)"
---

Given loaded $URI.

    (path, offset_top) ->
      @browser
        .url('http://localhost:8000' + path)
        .waitForElementVisible('body', 500)
        .resizeWindow(800, 600).pause(100)
        .execute("scrollTo(0,#{offset_top || 0})")

When I stop for $SECONDS.

    (seconds) ->
      @browser
        .pause(parseInt(seconds, 10) * 1000)

When I scroll to $NUMBER.

    (offset_top) ->
      @browser
        .execute("scrollTo(0,#{offset_top})")
        .expect.element('#scroll-kit-info .scroll').text.to.equal(offset_top)

$VERB should I see "$TEXT" within "$SELECTOR".

    (text, selector) ->
      @browser
        .expect.element(selector).text.to.contain(text)

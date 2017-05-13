Feature: Visible elements

Scenario: First load

  Given loaded "/"
  When I scroll to "0"
  Then should I see "0" within "#scroll-kit-info .keys"
  And should I see "initial / static" within "#scroll-kit-info .from_to"

Scenario: Scrolling forward

  Given loaded "/"
  When I scroll to "1000"
  Then should I see "0" within "#scroll-kit-info .keys"
  Then should I see "static / forward" within "#scroll-kit-info .from_to"

Scenario: Scrolling backward

  Given loaded "/"
  When I scroll to "1000"
  When I stop for "1s"
  When I scroll to "0"
  And should I see "static / backward" within "#scroll-kit-info .from_to"

Scenario: Pause after scrolling forward

  Given loaded "/"
  When I scroll to "1000"
  When I stop for "1s"
  Then should I see "forward / static" within "#scroll-kit-info .from_to"

Scenario: Pause after scrolling backward

  Given loaded "/"
  When I scroll to "1000"
  When I scroll to "0"
  When I stop for "1s"
  Then should I see "backward / static" within "#scroll-kit-info .from_to"

Scenario: Check scrolling indices

  Given loaded "/"
  When I scroll to "4000"
  Then should I see "2, 3" within "#scroll-kit-info .keys"
  And should I see "static / forward" within "#scroll-kit-info .from_to"

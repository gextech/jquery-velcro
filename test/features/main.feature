Feature: Scroll

Scenario: No scrolling

  Given loaded "/"
  Then should I see "static" within "#scroll-kit-info .from_to"
  Then should I see "initial" within "#scroll-kit-info .from_to"

Scenario: Scrolling forward

  Given loaded "/"
  When I scroll to "1000"
  Then should I see "forward" within "#scroll-kit-info .from_to"
  Then should I see "static" within "#scroll-kit-info .from_to"

Scenario: Scrolling backward

  Given loaded "/"
  When I scroll to "2000"
  When I stop for "1s"
  When I scroll to "0"
  Then should I see "backward" within "#scroll-kit-info .from_to"
  And should I see "static" within "#scroll-kit-info .from_to"

Scenario: Scrolling quickly

  Given loaded "/"
  When I scroll to "2000"
  When I scroll to "0"
  Then should I see "backward" within "#scroll-kit-info .from_to"

  When I scroll to "0"
  When I scroll to "2000"
  Then should I see "forward" within "#scroll-kit-info .from_to"

  When I stop for "1s"
  And should I see "static" within "#scroll-kit-info .from_to"

Scenario: Check scrolling indices

  Given loaded "/"
  When I scroll to "4000"
  Then should I see "2, 3" within "#scroll-kit-info .keys"
  Then should I see "static" within "#scroll-kit-info .from_to"
  And should I see "forward" within "#scroll-kit-info .from_to"

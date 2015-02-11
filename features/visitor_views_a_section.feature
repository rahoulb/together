Feature: visitor views a section

  As a visitor to a web-site
  I would like to visit a section
  So that I can see which pages are there

  Scenario: Viewing the section

    Given a web-site has been set up
    And the web-site has sections configured
    And some pages are attaches to the sections
    When I visit a section
    Then I should see the section header
    And I should see the section description
    Then I should see a list of pages with the newest first
    When I view the older pages
    Then I should see a list of older pages

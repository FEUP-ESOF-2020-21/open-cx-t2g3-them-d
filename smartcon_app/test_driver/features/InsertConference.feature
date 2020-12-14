Feature: Insert conference data
  Scenario: Conference staff member can insert conference data into the app
    Given I am at the 'home_page'
    When I tap the 'insert_conference_btn' button
    Then I will be redirected to the 'insert_conference_page'
    And I will be presented with the fields 'name_field', 'district_field', 'description_field', 'category_field' and 'dates_field'
    Then I fill the 'name_field' field with 'Conferencia Dummy'
    And I fill the 'description_field' field with 'This is a dummy conference'
    And I fill the 'category_field' and the 'district_field'
Feature: Create note

    As a User,
    I should be able to create note
    so that I can save them.
    Scenario: Create a note 
        Given I want to create a note 
        When I type "Hello World" 
        And I save the note
        Then It should be saved successfully 

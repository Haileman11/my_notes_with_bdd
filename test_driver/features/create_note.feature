Feature: Create note

    As a User,
    I should be able to create note
    so that I can save them.
    Scenario: Create a note 
        Given I want to create a note 
        When I tap the "New note" button        
        Then I should be navigated to an empty note
    Scenario: Save a new note         
        Given I have typed "Hello World"
        When I save the note
        Then The text "Hello World" should be saved successfully

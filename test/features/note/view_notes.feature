Feature: View notes
    As a User,
    I should be able to view notes
    so that I can manage them.
    Background: Setup injection
        Given injection is setup
    After: 
        Then clean up after the test
    Rule: I can see my saved notes
        Scenario: Should view the notes list when app is opened
            Given The saved notes list is not empty
            And The app is on {'/notes'} page
            Then I see {"NOTES_LIST"}
        Scenario: Should see a message saying there are no saved notes if notes list is empty
            Given The saved notes list is empty
            And The app is on {'/notes'} page
            Then I don't see {ListView} widget
            And I see {'You have no saved notes.'} text
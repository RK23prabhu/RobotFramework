*** Settings ***
Documentation    A test suite covering essential SeleniumLibrary keywords.
Library    SeleniumLibrary 

*** Variables ***
${URL}          https://the-internet.herokuapp.com/login
${BROWSER}      chrome
${USERNAME}     tomsmith
${PASSWORD}     SuperSecretPassword!

*** Test Cases ***
Comprehensive Selenium Interaction Test
    [Documentation]    Execution of common Selenium actions in a single flow.
    
    # 1. Open Browser & 2. Maximize Browser Window
    Open Browser               ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # 3. Element Should Be Visible (Verification)
    Element Should Be Visible  id=username
    Log To Console            Verified: Username field is visible.

    # 4. Input Text
    Input Text                id=username    ${USERNAME}
    Input Password            id=password    ${PASSWORD}
    
    # 5. Element Should Be Enabled
    Element Should Be Enabled  css=button[type='submit']
    Log To Console            Verified: Login button is enabled.

    # 6. Click Button
    Click Button              css=button[type='submit']
    
    # 7. Click Link
    # Navigating back or to a different section using a link
    Wait Until Page Contains   You logged into a secure area!
    Click Link                link=Elemental Selenium
    
    # 8. Click Element
    # Using Click Element for a generic div or specific non-button element
    # Switching back to the main window if the link opened a new tab
    Switch Window             main
    Click Element             css=.flash.success
    
    # 9. Capture Page Screenshot
    Capture Page Screenshot    final_state.png
    Log Test completed successfully. Screenshot saved.

    [Teardown]    Close Browser
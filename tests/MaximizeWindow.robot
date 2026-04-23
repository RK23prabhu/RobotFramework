*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://www.google.com
${BROWSER}       chrome

*** Test Cases ***
Browser And Logging Demo
    # Opens the browser and maximizes the window
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 1. Standard Log: Appends to the 'log.html' report file
    Log    This message will appear in the HTML log file.    level=INFO

    # 2. Log To Console: Prints directly to your terminal/command prompt
    Log To Console    This message is visible in the terminal during execution.

    # 3. Selenium Specific Action
    Page Should Contain Element    name=q
    Log    Verified search bar is present.

    [Teardown]    Close Browser
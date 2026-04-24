*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.google.com
${BROWSER}    Chrome

*** Test Cases ***
Demonstrate Loop And Selenium
    [Documentation]    A script to show loops and basic Selenium initialization.
    
    # Example 1: Printing numbers 1 to 5 (Standard Range)
    # IN RANGE starts at the first number and stops BEFORE the second.
    Log To Console    \n--- Printing 1 to 5 ---
    FOR    ${index}    IN RANGE    1    6
        Log To Console    Current Number: ${index}
    END

    # Example 2: Printing numbers with a step (Even numbers)
    Log To Console    \n--- Printing Even Numbers to 10 ---
    FOR    ${index}    IN RANGE    2    11    2
        Log To Console    Even Number: ${index}
    END

    # Example 3: Looping through a list of specific numbers
    Log To Console    \n--- Printing From a List ---
    @{numbers}=    Create List    10    20    30
    FOR    ${val}    IN    @{numbers}
        Log To Console    List Value: ${val}
    END

    # Basic Selenium Action
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Google
    [Teardown]    Close Browser
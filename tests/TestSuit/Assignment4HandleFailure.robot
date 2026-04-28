*** Settings ***
Library    SeleniumLibrary 


*** Variables ***
${URL}            https://the-internet.herokuapp.com/
${BROWSER}        Chrome
${NON_EXISTENT}   id:this-element-does-not-exist
${EXISTING}       link:Checkboxes

*** Test Cases ***
Handle Expected Failure Example
    [Documentation]    Demonstrates how to ignore an error and take action based on the result.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 1. Run Keyword And Ignore Error
    # This will attempt to click a non-existent button but won't stop the test.
    ${status}    ${message} =    Run Keyword And Ignore Error    Click Element    ${NON_EXISTENT}

    # 2. Log the results to see what happened
    Log To Console    \nExecution Status: ${status}
    Log To Console    Error Message Received: ${message}

    # 3. Conditional logic based on the status
    IF    '${status}' == 'FAIL'
        Log To Console    The element wasn't found, but I'm still running!
        # Fallback action
        Click Element    ${EXISTING}
        Log To Console    Successfully clicked the fallback element.
    ELSE
        Log To Console    The element was actually found!
    END

    Page Should Contain    Checkboxes
    [Teardown]    Close Browser
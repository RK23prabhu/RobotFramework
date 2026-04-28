*** Settings ***
Library    SeleniumLibrary 

Library    ../libraries/utils.py
Resource   ../resources/keywords.robot

Suite Setup       Open Application
Suite Teardown    Close Application
Test Setup        Log To Console    ===== Test Started =====
Test Teardown     Log To Console    ===== Test Finished =====

*** Variables ***
${EXPECTED_MENU_TEXT}    Menu

*** Test Cases ***

Valid Login Test
    [Tags]    smoke    login
    Login To App    ${USERNAME}    ${PASSWORD}
    Validate Dashboard

Navigation Test
    [Tags]    regression    navigation
    Login To App    ${USERNAME}    ${PASSWORD}
    Navigate To Menu
    Page Should Contain    ${EXPECTED_MENU_TEXT}

Logout Test
    [Tags]    regression    logout
    Login To App    ${USERNAME}    ${PASSWORD}
    Logout From App
    Page Should Contain    login

Python Integration Test
    [Tags]    regression    python
    ${user}=    Generate Random User
    Log    Generated User: ${user}
    ${result}=    Validate Text    user    ${user}
    Log    Validation Result: ${result}
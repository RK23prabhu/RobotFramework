*** Settings ***
Library    SeleniumLibrary
Resource   locators.robot
Resource   variables.robot

*** Keywords ***

Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

Close Application
    Capture Page Screenshot
    Close Browser

Login To App
    [Arguments]    ${user}    ${pass}
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Input Text    ${USERNAME_FIELD}    ${user}
    Input Text    ${PASSWORD_FIELD}    ${pass}
    Click Button    ${LOGIN_BTN}
    Wait Until Element Is Visible    ${DASHBOARD}    10s

Validate Dashboard
    Element Should Be Visible    ${DASHBOARD}
    Element Should Be Enabled    ${DASHBOARD}
    Page Should Contain    Dashboard

Navigate To Menu
    Click Link    ${MENU_LINK}
    Wait Until Element Is Visible    ${PAGE_HEADER}
    ${title}=    Get Text    ${PAGE_HEADER}
    Log    Navigated Page: ${title}

Logout From App
    Click Element    ${LOGOUT_BTN}
    Wait Until Element Is Not Visible    ${DASHBOARD}
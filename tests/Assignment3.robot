*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://the-internet.herokuapp.com/dropdown
${BROWSER}       Chrome
${DROPDOWN}      id:dropdown

*** Test Cases ***
Handle Dropdown Menu Options
    [Documentation]    Test selecting dropdown options by Index, Value, and Label.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5 seconds

    # 1. Select From List By Index (Index starts at 0)
    # Note: In this specific URL, Index 0 is often a placeholder ("Please select an option")
    Select From List By Index    ${DROPDOWN}    1
    List Selection Should Be    ${DROPDOWN}    Option 1

    # 2. Select From List By Value (The 'value' attribute in HTML)
    Select From List By Value    ${DROPDOWN}    2
    List Selection Should Be    ${DROPDOWN}    Option 2

    # 3. Select From List By Label (The visible text in the UI)
    Select From List By Label    ${DROPDOWN}    Option 1
    List Selection Should Be    ${DROPDOWN}    Option 1

    [Teardown]    Close Browser
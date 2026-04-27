*** Settings ***
Library    SeleniumLibrary
Variables    test_data.py    # Importing the python file

*** Test Cases ***
Login With External Data
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id:username    ${VALID_USER}
    Input Password  id:password    ${VALID_PASS}
    Click Button    css:button[type='submit']
    Page Should Contain    You logged into a secure area!
    [Teardown]    Close Browser
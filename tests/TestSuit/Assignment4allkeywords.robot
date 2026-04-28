*** Settings ***
Documentation     A master suite covering major SeleniumLibrary keyword categories.
Library    SeleniumLibrary 

*** Variables ***
${URL}            https://the-internet.herokuapp.com/checkboxes
${BROWSER}        chrome
${LOGIN_URL}      https://the-internet.herokuapp.com/login

*** Test Cases ***
Master Selenium Keyword Demo
    [Documentation]    Covers Navigation, Forms, Assertions, and Browser Control.
    
    # --- 1. Browser Management ---
    Open Browser                ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          0.2 seconds    # Slows execution for visibility
    
    # --- 2. Checkboxes & Radio Buttons ---
    Select Checkbox             xpath=(//input[@type='checkbox'])[1]
    Checkbox Should Be Selected  xpath=(//input[@type='checkbox'])[1]
    Unselect Checkbox           xpath=(//input[@type='checkbox'])[1]

    # --- 3. Navigation & Input ---
    Go To                       ${LOGIN_URL}
    Input Text                  id=username    tomsmith
    Input Password              id=password    SuperSecretPassword!
    
    # --- 4. Assertions (Validation) ---
    Element Should Be Visible   css:button[type="submit"]
    Element Text Should Be      tag:h2    Login Page
    Page Should Contain         This is where you can log into the secure area
    
    # --- 5. Clicking & Form Submission ---
    Click Button                class:radius
    Wait Until Page Contains    You logged into a secure area!

    # --- 6. Advanced Interactions ---
    # Mouse Hover (Example on a different element if available)
    Mouse Over                  id=page-footer
    
    # Execute JavaScript (e.g., scrolling or alerting)
    Execute Javascript          window.scrollTo(0, document.body.scrollHeight)
    
    # --- 7. Screen Capture & Logging ---
    Log                         Test reached final validation stage.
    Log To Console              Capturing final screenshot...
    Capture Page Screenshot     master_test_result.png

    [Teardown]    Close All Browsers
*** Settings ***
Library    SeleniumLibrary 

Resource ../resources/keywords.robot
Resource ../resources/variables.robot

Suite Setup Open Application
Suite Teardown Close Application
Test Setup Log To Console Starting Test
Test Teardown Capture Evidence

*** Test Cases ***

Login And Validate Dashboard
[Tags] smoke regression
Login To Application
Validate Login Success

Navigation To Profile Page
[Tags] regression
Login To Application
Validate Login Success
Navigate To Section
Validate Navigation

Invalid Login Validation
[Tags] negative
Input Text ${USER_FIELD} wrong
Input Text ${PASS_FIELD} wrong
Click Button ${LOGIN_BTN}
Run Keyword And Expect Error * Element Should Be Visible ${DASHBOARD}

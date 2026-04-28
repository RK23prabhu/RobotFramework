*** Settings ***
Library    SeleniumLibrary 

Resource ../resources/keywords.robot
Resource ../resources/variables.robot

Suite Setup Open Application
Suite Teardown Close Application

*** Test Cases ***

Validate Login Page UI
[Tags] smoke ui
Validate Login Page Elements

Login And Validate Dashboard
[Tags] regression
Validate Login Page Elements
Login With Valid Credentials
Validate Successful Login

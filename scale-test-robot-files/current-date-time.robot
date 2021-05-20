*** Settings ***
Library    SeleniumLibrary
Library    DateTime

*** Test Cases ***
TC1:Check Current time
    ${TimeNow}=    Get Current Date
    Log To Console    ${TimeNow}
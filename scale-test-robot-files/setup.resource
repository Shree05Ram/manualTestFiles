*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${EMAIL}    admin@aikaan.io
${PASS}     admin@123456
#${EMAIL}    scaletest@aikaan.io
#${PASS}     scaletest@123456
${TIMEOUT}    60s

*** Keywords ***
KEY_SIGN_IN
    Wait Until Page Contains Element    id:login_email
    Input Text    id:login_email    ${EMAIL}
    Input Text    id:login_password     ${PASS}
    Click Button    id:login_button

KEY_SKIP_HELP_TOUR
    Wait Until Page Contains Element    xpath:/html/body/div[3]/div/div/div/div[2]/div/button    timeout=${TIMEOUT}
    Click Element     xpath:/html/body/div[3]/div/div/div/div[2]/div/button

KEY_FEEDBACK_MESSAGE
    Wait until Page Contains    Message    timeout=${TIMEOUT}
    Wait Until Page Does Not Contain    Message    timeout=${TIMEOUT}
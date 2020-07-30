*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${SERVER_ENV}      test.aikaan.io
${SPEED_ENV}       0s
${EMAIL_ENV}       admin@aikaan.io
${PASSWORD_ENV}    admin@123456
${BASE_URL}        https://${SERVER_ENV}/
${LOGIN_URL}       ${BASE_URL}login

*** Test Cases ***
Login Test
    Open Browser    ${LOGIN_URL}    Firefox
    Set Selenium Speed      ${SPEED_ENV}
    Input Text      login_email     ${EMAIL_ENV}
    Input Text      login_password    ${PASSWORD_ENV}
    Click Button    login_button
    Wait Until Page Contains        Hello! Welcome to AiKaan dashboard
    Location Should Be      ${BASE_URL}

KEY_SKIP_HELP_TOUR
    Wait Until Page Contains Element    css:.react-joyride__tooltip > div:nth-child(2) > div:nth-child(1) > button:nth-child(1)
    Click Element    css:.react-joyride__tooltip > div:nth-child(2) > div:nth-child(1) > button:nth-child(1)


Check Whether the monitor Page Exists in the DP Config
    Click Element   id:nav_dgp
    Wait Until Page Contains Element    id:dgp_2.37.X
    Click Element   id:dgp_2.37.X
    Click Element   id:device_profile_configure_menu
    Wait Until Page Contains Element    xpath:/html/body/div/div/div[2]/div[3]/div[1]/div/a[3]    #Monitor side-tab
    Click Element   xpath:/html/body/div/div/div[2]/div[3]/div[1]/div/a[3]

Add Log Files
    #FOR , IN RANGE and END keywords should be in Caps. IN RANGE includes 1 but excludes 10 so the values will be from 1 to 9
    FOR    ${val}    IN RANGE    1   10
        Click Element   xpath:/html/body/div/div/div[2]/div[3]/div[2]/div/div[7]/button    #Add Log file btn
        Input Text      xpath:/html/body/div[2]/div/div[2]/form/div/div/input    /home/pi/manualTestFiles/event-for-error-logs/${val}-log.txt
        Click Element   xpath:/html/body/div[2]/div/div[3]/button[2]                       #Add btn
        Sleep    6s
        Wait Until Page Contains Element    xpath:/html/body/div/div/div[2]/div[3]/div[2]/div/div[7]/button    #Add Log file btn
    END

*** Settings ***
Library         SeleniumLibrary
Library         Collections
Resource        setup.resource
Suite Setup     Run Keywords
#...                 Open Browser    https://scaletest-controller.aikaan.io    Firefox    AND
...                 Open Browser    https://test.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_DP_NAV_TAB
Suite Teardown      Close Browser

*** Variables ***
${DP_NAME}          100-cmds
${CMD_PREFIX}       Scale-CMD
${TIMEOUT}          15s

*** Test Cases ***
TC01: Add 100 cmds
    KEY_CLICK_DP
    FOR    ${i}    IN RANGE    1    101
        KEY_SELECT_CMD    ${i}
        KEY_EXEC_CMD
        KEY_FEEDBACK_MESSAGE
    END

*** Keywords ***
KEY_CLICK_DP_NAV_TAB
    Wait Until Page Contains Element   id:nav_dgp    timeout=${TIMEOUT}
    Click Element   id:nav_dgp

KEY_CLICK_DP
    Wait Until Page Contains Element    id:dgp_${DP_NAME}    timeout=${TIMEOUT}
    Click Element    id:dgp_${DP_NAME}

KEY_SELECT_CMD
    [Arguments]    ${i}
    Wait Until Page Contains Element    xpath:/html/body/div/div[2]/div[3]/div/div[2]/div[2]/div[1]    timeout=${TIMEOUT}
    Input Text    xpath:/html/body/div/div[2]/div[3]/div/div[2]/div[2]/div[1]/input    ${CMD_PREFIX}-${i}   #Select cmd input field
    Click Element    xpath:/html/body/div/div[2]/div[3]/div/div[2]/div[2]/div[1]/div[2]/div[1]              #Click on the very first option in the dropdown field

KEY_EXEC_CMD
    Click Element    xpath:/html/body/div/div[2]/div[3]/div/div[2]/div[2]/div[2]/button         #Execute button
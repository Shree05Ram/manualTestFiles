*** Settings ***
Library         SeleniumLibrary
Resource        setup.resource
Suite Setup     Run Keywords
...                 Open Browser    https://scaletest-controller.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_DP_NAV_TAB
Suite Teardown      Close Browser

*** Variables ***
${DP_NAME}    Scale-DP
${TIMEOUT}    15s

*** Test Cases **
TC01: Create 100 device prfoiles
    FOR    ${i}    IN RANGE    1    101
        KEY_CREATE_DP    ${DP_NAME}-${i}
        KEY_FEEDBACK_MESSAGE
    END

*** Keywords ***
KEY_CLICK_DP_NAV_TAB
    Wait Until Page Contains Element   id:nav_dgp
    Click Element   id:nav_dgp

KEY_CREATE_DP
    [Arguments]    ${DP_NAME}
    KEY_CLICK_DP_CREATE_BTN
    KEY_ENTER_DP_NAME_AND_CLICK_SAVE_BTN    ${DP_NAME}

KEY_CLICK_DP_CREATE_BTN
    Wait Until Page Contains Element    id:dgp_create
    Click Button    id:dgp_create

KEY_ENTER_DP_NAME_AND_CLICK_SAVE_BTN
    [Arguments]    ${DP_NAME}
    Input Text      id:dgp_name    ${DP_NAME}
    Click Button    id:dgp_save

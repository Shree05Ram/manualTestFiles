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
${DP_NAME}             100-cmds
${PROCESS_PREFIX}    scale-process
${TIMEOUT}             15s

*** Test Cases ***
TC01: Add 100 cmds
    [Setup]     Run Keywords
    ...             KEY_CLICK_DP
    ...             KEY_CLICK_CONF_TAB
    ...             KEY_CLICK_MONITOR_TAB
    FOR    ${i}    IN RANGE    1    101
        KEY_CLICK_ADD_PROCESS_BTN
        KEY_ENTER_PROCESS    ${i}
        KEY_CLICK_ADD_BTN
        KEY_FEEDBACK_MESSAGE
        Log To Console    ${PROCESS_PREFIX}-${i} added
    END

*** Keywords ***
KEY_CLICK_DP_NAV_TAB
    Wait Until Page Contains Element   id:nav_dgp    timeout=${TIMEOUT}
    Click Element   id:nav_dgp

KEY_CLICK_DP
    Wait Until Page Contains Element    id:dgp_${DP_NAME}    timeout=${TIMEOUT}
    Click Element    id:dgp_${DP_NAME}

KEY_CLICK_CONF_TAB
    Wait Until Page Contains Element    id:device_profile_configure_menu    timeout=${TIMEOUT}
    Click Element    id:device_profile_configure_menu

KEY_CLICK_MONITOR_TAB
    Wait Until Page Contains Element    id:device_profile_configure_menu_monitoring    timeout=${TIMEOUT}
    Click Element    id:device_profile_configure_menu_monitoring

KEY_CLICK_ADD_PROCESS_BTN
    Wait Until Page Contains Element    id:add_new_process_btn    timeout=${TIMEOUT}
    Click Element    id:add_new_process_btn

KEY_ENTER_PROCESS
    [Arguments]    ${i}
    Wait Until Page Contains Element    id:add_new_process_process_name_input    timeout=${TIMEOUT}
    Input Text    id:add_new_process_process_name_input    ${PROCESS_PREFIX}-${i}

KEY_CLICK_ADD_BTN
    Wait Until Page Contains Element    id:add_new_process_add_btn    timeout=${TIMEOUT}
    Click Element    id:add_new_process_add_btn
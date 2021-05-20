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
${MONITOR_FILE}    /opt/scale-log-file
${TIMEOUT}             15s

*** Test Cases ***
TC01: Add 100 cmds
    [Setup]     Run Keywords
    ...             KEY_CLICK_DP
    ...             KEY_CLICK_CONF_TAB
    ...             KEY_CLICK_MONITOR_TAB
    FOR    ${i}    IN RANGE    71    101
        KEY_CLICK_ADD_LOG_FILE_BTN
        KEY_ENTER_FILE    ${i}
        KEY_CLICK_ADD_BTN
        KEY_FEEDBACK_MESSAGE
        Log To Console    ${MONITOR_FILE}-${i}.txt added
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

KEY_CLICK_ADD_LOG_FILE_BTN
    Wait Until Page Contains Element    id:add_new_logfile_btn    timeout=${TIMEOUT}
    Click Element    id:add_new_logfile_btn

KEY_ENTER_FILE
    [Arguments]    ${i}
    Wait Until Page Contains Element    id:add_new_logfile_name_input    timeout=${TIMEOUT}
    Input Text    id:add_new_logfile_name_input    ${MONITOR_FILE}-${i}.txt

KEY_CLICK_ADD_BTN
    Wait Until Page Contains Element    id:add_new_logfile_add_btn    timeout=${TIMEOUT}
    Click Element    id:add_new_logfile_add_btn
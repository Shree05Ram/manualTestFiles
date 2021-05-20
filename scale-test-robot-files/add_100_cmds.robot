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
@{CMDS_LIST_VAR}    ls -la    pwd    cd /    mkdir /opt/cmd_test_dir    touch /opt/cmd_test.txt    echo "hi"    df -m    uname -a    hostname    ping -c 3 google.com


*** Test Cases ***
TC01: Add 100 cmds
    [Setup]     Run Keywords
    ...             KEY_CLICK_DP
    ...             KEY_CLICK_CONF_TAB
    ...             KEY_CLICK_DEV_CMD_SIDE_TAB
    FOR    ${i}    IN RANGE    1    101
        KEY_CLICK_ADD_CMD_BTN
        KEY_FILLUP_FORM    ${i}
        KEY_FEEDBACK_MESSAGE
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

KEY_CLICK_DEV_CMD_SIDE_TAB
    Wait Until Page Contains Element    id:device_profile_configure_menu_device_commands    timeout=${TIMEOUT}
    Click Element    id:device_profile_configure_menu_device_commands

KEY_CLICK_ADD_CMD_BTN
    Wait Until Page Contains Element    id:add_new_command_btn    timeout=${TIMEOUT}
    Click Element    id:add_new_command_btn

KEY_FILLUP_FORM
    [Arguments]    ${i}
    #Enter CMD name
    Wait Until Page Contains Element    id:command_name_input    timeout=${TIMEOUT}
    Input Text    id:command_name_input    ${CMD_PREFIX}-${i}
    #Enter CMD Description
    Input Text    id:command_desc_input    "This command is added to perform scale test. The cmd count is ${i}"
    #Enter CMD
    ${List_Index}=    Evaluate    ${i} % 10
    ${CMD}=    Get From List    ${CMDS_LIST_VAR}    ${List_Index}
    Input Text    id:command_value_input    ${CMD}
    #Save The CMD
    Click Element    id:command_add_btn
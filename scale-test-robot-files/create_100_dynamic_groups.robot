*** Settings ***
Library         SeleniumLibrary
Resource        setup.resource
Suite Setup     Run Keywords
...                 Open Browser    https://test.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_DG_NAV_TAB
Suite Teardown      Close Browser

*** Variables ***
${DYNAMIC_GROUP_NAME}    Scale-DG

*** Test Cases ***
TC01: Create 100 Dynamic Groups
    FOR    ${i}    IN RANGE    1    101
        KEY_CREATE_DG   ${DYNAMIC_GROUP_NAME}-${i}
        KEY_FEEDBACK_MESSAGE
    END

*** Keywords ***
KEY_CLICK_DG_NAV_TAB
    Wait Until Page Contains Element    id:nav_customgroups
    Click Element    id:nav_customgroups

KEY_CREATE_DG
    [Arguments]     ${DYNAMIC_GROUP_NAME}
    KEY_CLICK_DG_CREATE_BTN
    KEY_ENTER_DG_NAME_AND_CLICK_NEXT_BTN    ${DYNAMIC_GROUP_NAME}
    KEY_CLICK_DG_CREATE_BTN_DYNAMIC

KEY_CLICK_DG_CREATE_BTN
    Wait Until Page Contains Element    id:custom_group_create_btn
    Click Button    id:custom_group_create_btn

KEY_ENTER_DG_NAME_AND_CLICK_NEXT_BTN
    [Arguments]    ${DYNAMIC_GROUP_NAME}
    Input Text       id:custom_group_name_input    ${DYNAMIC_GROUP_NAME}
    Click Button    id:custom_group_create_next_btn

KEY_CLICK_DG_CREATE_BTN_DYNAMIC
    Wait Until Page Contains Element    id:custom_group_create_create_btn
    Click Button    id:custom_group_create_create_btn

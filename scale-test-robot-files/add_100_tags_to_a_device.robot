*** Settings ***
Library         SeleniumLibrary
Library         DateTime
Resource        setup.resource
Suite Setup     Run Keywords
...                 Open Browser    https://test.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_DEVICES_NAV_TAB
Suite Teardown      Close Browser

*** Variables ***
${TIMEOUT}           15s
${TAG_KEY_PREFIX}    ScaleTestTag
${TAG_VAL_PREFIX}    ScaleTagVal

*** Test Cases ***
TC1: Add 100 tags to 2 devices in one go
    KEY_SELECT_2_DEVICES
    KEY_CLICK_ACTIONS_BTN
    KEY_CLICK_ADD_TAGS_OPTN
    FOR    ${i}    IN RANGE    1    101
        KEY_SELECT_TAG_KEY    ${i}
        KEY_ENTER_TAG_VAL    ${i}
        KEY_CLICK_ADD_TAG_BTN
    END
    KEY_CLICK_APPLY_TAGS_BTN
    KEY_FEEDBACK_MESSAGE

*** Keywords ***
KEY_CLICK_DEVICES_NAV_TAB
    Wait Until Page Contains Element    id:nav_devices      timeout=${TIMEOUT}
    Click Element    id:nav_devices

KEY_SELECT_2_DEVICES
    Wait Until Page Contains Element    id:devices_table    timeout=${TIMEOUT}
    Click Element    xpath:/html/body/div/div[2]/table/tbody/tr[1]/td[1]/div    #Tic first device
    Click Element    xpath:/html/body/div/div[2]/table/tbody/tr[2]/td[1]/div    #Tic second device

KEY_CLICK_ACTIONS_BTN
    Wait Until Element Is Enabled    id:devices_actions_dropdown    timeout=${TIMEOUT}
    Click Element    id:devices_actions_dropdown

KEY_CLICK_ADD_TAGS_OPTN
    Wait Until Page Contains Element    id:devices_add_tags_option    timeout=${TIMEOUT}
    Click Element    id:devices_add_tags_option

KEY_SELECT_TAG_KEY
    [Arguments]    ${i}
    Wait Until Page Contains Element    id:tag_key_dropdown    timeout=${TIMEOUT}
    Click Element    id:tag_key_dropdown

    #Select Tag Key
    Input Text    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/input    ${TAG_KEY_PREFIX}${i}     #Enter tag key
    Click Element    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div    #Select the first option from the dropdown list

KEY_ENTER_TAG_VAL
    [Arguments]    ${i}
    ${DATE}=    Get Current Date
    Input Text    id:tag_value_input    ${TAG_VAL_PREFIX}${DATE}

KEY_CLICK_ADD_TAG_BTN
        Wait Until Element Is Enabled    id:add_tag_btn    timeout=${TIMEOUT}
        Click Element    id:add_tag_btn

KEY_CLICK_APPLY_TAGS_BTN
        Click Element    id:add_tags_apply_btn

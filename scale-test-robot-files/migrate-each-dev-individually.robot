*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         String
Resource        setup.resource
Suite Setup     Run Keywords
...                 Open Browser    https://scaletest-controller.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_DEVICES_NAV_TAB
#Suite Teardown      Close Browser

*** Variables ***
${SOURCE_DP_NAME}         destin-dp
${DESTINATION_DP_NAME}    agent-sim-profile
${FILE_NAME}              ${CURDIR}/mig-test-indiv.csv
${TIMEOUT}                15s

*** Test Cases ***
TC01: Migrate individual devices
    [Setup]    KEY_FILTER_DEVICES
    Log to Console    Filtered successfully
    ${contents}=    Get File    ${FILE_NAME}
    @{Devices}=    Split To Lines    ${contents}
    Log To Console    List Variable set
    FOR    ${dev}    IN    @{Devices}
        KEY_CLICK_ON_DEVICE    ${dev}
        KEY_CLICK_GEAR_ICON
        KEY_CHANGE_DP
        KEY_FEEDBACK_MESSAGE
        KEY_GO_BACK_TO_DEVICES_PAGE
    END

*** Keywords ***
KEY_CLICK_DEVICES_NAV_TAB
    Wait until Page Contains Element    id:nav_devices      timeout=${TIMEOUT}
    Click Element    id:nav_devices

KEY_FILTER_DEVICES
    Wait Until Page Contains Element    id:devices_add_filters_btn    timeout=${TIMEOUT}
    Click Element    id:devices_add_filters_btn

    #Select Device Profile
    Wait Until Page Contains Element    id:select_key_dropdown    timeout=${TIMEOUT}
    Click Element    id:select_key_dropdown
    Wait Until Page Contains Element    xpath:/html/body/div[2]/div/div[2]/div/div[1]/div[2]/div[1]    timeout=${TIMEOUT}    #Device Profile option in the dropdown list
    Click Element    xpath:/html/body/div[2]/div/div[2]/div/div[1]/div[2]/div[1]
    Click Element    id:select_values_dropdown
    Input Text      xpath:/html/body/div[2]/div/div[2]/div/div[2]/input    ${SOURCE_DP_NAME}
    Wait Until Page Contains Element    xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[1]    timeout=${TIMEOUT}     #very first device profile name in the dropdown list
    Click Element    xpath:/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[1]
    Click Element    id:done_btn

KEY_CLICK_ON_DEVICE
    [Arguments]    ${dev}
    Log To Console      ${dev} is going to be migrated
    Wait Until Page Contains Element    id:device_${dev}    timeout=${TIMEOUT}
    Click Element    id:device_${dev}

KEY_CLICK_GEAR_ICON
    Wait Until Page Contains Element    id:devicedetails_profile_edit_btn    timeout=${TIMEOUT}
    Click Element    id:devicedetails_profile_edit_btn

KEY_CHANGE_DP
    Log To Console    Changing the device profile
    Wait Until Page Contains Element    id:devicedetails_profile_edit_dropdown    timeout=${TIMEOUT}
    Click Element    id:devicedetails_profile_edit_dropdown

    #Choose the destination DP
    Wait Until Page Contains Element    id:profile_edit_dropdown_option_${DESTINATION_DP_NAME}    timeout=${TIMEOUT}
    Click Element    id:profile_edit_dropdown_option_${DESTINATION_DP_NAME}

    #Click Save button
    Wait Until Element Is Enabled    id:devicedetails_profile_edit_save_btn    timeout=${TIMEOUT}
    Click Element    id:devicedetails_profile_edit_save_btn

KEY_GO_BACK_TO_DEVICES_PAGE
    Log To Console    Device Profile Changed
    Go Back
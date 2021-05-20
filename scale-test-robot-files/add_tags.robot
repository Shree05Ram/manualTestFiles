*** Settings ***
Library         SeleniumLibrary
Resource        setup.resource
Suite Setup     Run Keywords
...					Open Browser	https://scaletest-controller.aikaan.io    Firefox    AND
...					Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...					KEY_SKIP_HELP_TOUR    AND
...					KEY_CLICK_DEVICES_NAV_TAB
Suite Teardown		Close Browser

*** Variables ***
${TIMEOUT}      10s
${TAG_VALUE}    5k

*** Test Cases ***
TC1: Add Tags
    Sleep    30s        # sleep to select the number of Rows per page

    FOR    ${val}    IN RANGE    1    51
        #Select Devices
        Wait Until Page Contains Element    id:devices_table    timeout=${TIMEOUT}
        Wait Until Page Contains Element    xpath:/html/body/div/div[2]/table/thead/tr/th[1]/div    timeout=${TIMEOUT}    #Top checkbox
        Click Element    xpath:/html/body/div/div[2]/table/thead/tr/th[1]/div

        #Click on the Actiions button
        Wait Until Element Is Enabled    id:devices_actions_dropdown    timeout=${TIMEOUT}
        Click Element    id:devices_actions_dropdown

        #Choose Add tags option
        Wait Until Page Contains Element    id:devices_add_tags_option    timeout=${TIMEOUT}
        Click Element    id:devices_add_tags_option

        #Select tag key
        Wait Until Page Contains Element    id:tag_key_dropdown    timeout=${TIMEOUT}
        Click Element    id:tag_key_dropdown
        Wait Until Page Contains Element     xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div[2]    timeout=${TIMEOUT}    #2nd tag key in the tagkey dropdown list
        Click Element    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div[2]
        #Wait Until Page Contains Element    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div[4]    timeout=${TIMEOUT}    #4th tag key in the tagkey dropdown list
        #Click Element    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div[4]
        #Wait Until Page Contains Element    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div[6]    timeout=${TIMEOUT}    #6th tag key
        #Click Element    xpath:/html/body/div[2]/div/div[2]/form/div/div[1]/div/div[2]/div[6]

        #Enter tag value
        Input Text    id:tag_value_input    ${TAG_VALUE}

        #Add tag
        Wait Until Element Is Enabled    id:add_tag_btn    timeout=${TIMEOUT}
        Click Element    id:add_tag_btn

        #Apply tags button
        Click Element    id:add_tags_apply_btn

        #Wait For Feedback Message
        Wait until Page Contains    Message    timeout=15s
        Wait Until Page Does Not Contain    Message    timeout=15s

        Wait Until Page Contains Element    xpath:/html/body/div/div[2]/div[1]/div[2]/a[9]    timeout=${TIMEOUT}      #Next page pagination
        Click Element    xpath:/html/body/div/div[2]/div[1]/div[2]/a[9]     #Next page pagination

        #Wait Until Page Contains Element    xpath:/html/body/div/div[2]/div[1]/div[2]/a[1]    timeout=${TIMEOUT}       #Previous page pagination
        #Click Element    xpath:/html/body/div/div[2]/div[1]/div[2]/a[1]       #Previous page pagination

        Log To Console    ${val}
    END
    Log to Console	Done

*** Keywords ***
KEY_CLICK_DEVICES_NAV_TAB
    Wait until Page Contains Element    id:nav_devices      timeout=60s
    Click Element    id:nav_devices
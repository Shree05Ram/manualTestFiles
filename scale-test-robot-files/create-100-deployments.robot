*** Settings ***
Library         SeleniumLibrary
Resource        setup.resource
Suite Setup     Run Keywords
...                 Open Browser    https://test.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_DEVICES_NAV_TAB
Suite Teardown      Close Browser

*** Variables ***
${DEV}          RaspberryPi@wolfpack
${ARTIFACT}    artifact

*** Test Cases ***
TC_16: creat 100 deployments
    KEY_SEARCH_FOR_DEVICE    ${DEV}
    KEY_CLICK_ON_DEVICE      ${DEV}
    KEY_CLICK_ON_DEPLOYMENT_SUB_TAB
    FOR    ${i}    IN RANGE    1    101
        KEY_CREATE_DEPLOYMENT    ${ARTIFACT}    ${i}
        KEY_FEEDBACK_MSG
        KEY_REFRESH_DEP_LIST
    END

*** Keywords ***
KEY_CLICK_DEVICES_NAV_TAB
    Wait until Page Contains Element    id:nav_devices      timeout=10s
    Click Element    nav_devices

KEY_SEARCH_FOR_DEVICE
    [Arguments]    ${DEV}
    Wait Until Page Contains Element    id:devices_search_input
    Input Text    id:devices_search_input    ${DEV}

KEY_CLICK_ON_DEVICE
    [Arguments]    ${DEV}
    Wait Until Page Contains Element    id:devices_table
    Click Element    id:device_${DEV}

KEY_CLICK_ON_DEPLOYMENT_SUB_TAB
    Wait Until Page Contains Element    id:devicedetails_deployments_tab
    Click Element    id:devicedetails_deployments_tab

KEY_CREATE_DEPLOYMENT
    [Arguments]    ${ARTIFACT}    ${i}
    KEY_CLICK_CREATE_DEPL_BTN
    KEY_FILLUP_FORM    ${ARTIFACT}    ${i}
    KEY_CLICK_DEPLOY_BTN

KEY_CLICK_CREATE_DEPL_BTN
    Wait Until Page Contains Element    id:create_deployment_btn
    Click Element    id:create_deployment_btn

KEY_FILLUP_FORM
    [Arguments]    ${ARTIFACT}    ${i}
    Wait Until Page Contains Element    id:create_deployment_name_input
    Input Text    id:create_deployment_name_input    dep${i}

    #Select the artifact
    Click Element    id:create_deployment_artifacts_dropdown
    ${x}=    Evaluate    ${i} % 3 +1
    #Input Text    xpath:/html/body/div[3]/div/div[2]/form/div[3]/div/input    ${ARTIFACT}--${x}      #Artifact input field
    Wait Until Page Contains Element    id:artifact_option_${ARTIFACT}--${x}
    Click Element    id:artifact_option_${ARTIFACT}--${x}

KEY_CLICK_DEPLOY_BTN
    Sleep    5s
    Click Element    id:create_deployment_deploy_btn

KEY_FEEDBACK_MSG
    Wait until Page Contains    Message    timeout=15s
    Wait Until Page Does Not Contain    Message    timeout=15s

KEY_REFRESH_DEP_LIST
    Click Element    id:deployments_refresh_btn
    Wait Until Page Contains Element    id:deployments_table    timeout=15s
*** Settings ***
[Documentation]    This script will upload 100 artifacts present the "scale-test-artifacts" dir. The artifact names should be ${ARTIFACT_NAME}-${i}.mender
Library         SeleniumLibrary
Library         OperatingSystem
Resource        setup.resource
Suite Setup     Run Keywords
...                 Open Browser    https://test.aikaan.io    Firefox    AND
...                 Maximize Browser Window    AND
...                 KEY_SIGN_IN    AND
...                 KEY_SKIP_HELP_TOUR    AND
...                 KEY_CLICK_OTA_UPGRADE_NAV_TAB
Suite Teardown   Close Browser

*** Variables ***
${ARTIFACT_NAME}    scale-artifact
${TIMEOUT}          10s
${ARTIFACT_DIR}     ${CURDIR}/../../scale-test-artifacts

*** Test Cases ***
FU_AF_TC_01: Upload 100 artifacts
    FOR    ${i}    IN RANGE    11    101
        KEY_UPLOAD_ARTIFACT    ${ARTIFACT_NAME}-${i}.mender
        Log To Console        Uploaded ${ARTIFACT_NAME}-${i}.mender file
    END

#FU_AF_TC_03: Delete 100 artifacts
#    KEY_ARTIFACT_DELETE_ICON_AND_CONFIRM    ${ARTIFACT}
#    KEY_VALIDATE_ARTIFACT_DELETION    ${ARTIFACT}

*** Keywords ***
KEY_CLICK_OTA_UPGRADE_NAV_TAB
    Wait Until Page Contains Element    id:nav_ota_upgrade
    Click Element    id:nav_ota_upgrade

KEY_UPLOAD_ARTIFACT
    [Arguments]    ${ARTIFACT}
    Wait Until Page Contains    Upload an Artifact    timeout=${TIMEOUT}
    Choose File    id:upload_artifact_btn    ${ARTIFACT_DIR}/${ARTIFACT}
    Wait Until Page Contains Element    id:artifacts_upload_progress    timeout=${TIMEOUT}
    Wait Until Page Does Not Contain Element    id:artifacts_upload_progress    timeout=${TIMEOUT}
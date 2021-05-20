*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Suite Setup         Run Keywords
...                     Open Browser    https://artifact.aikaan.io    Firefox    ff_profile_dir=set_preference('browser.helperApps.neverAsk.saveToDisk','text/plain,application/octet-stream');set_preference('browser.download.manager.showWhenStarting',False);set_preference('browser.download.dir','//home/shree/Desktop/Aikaan/scale-test-artifacts');set_preference('browser.download.folderList',2);set_preference('pdfjs.disabled',True);update_preferences()    AND
...                     Wait Until Page Contains Element    xpath:/html/body/div/main/div/div/div/button    timeout=10s    AND
...                     Click Element    xpath:/html/body/div/main/div/div/div/button
Suite Teardown      Close Browser

*** Variables ***
${ARTIFACT_NAME}    scale-artifact
${DEV_TYPE}         x86_64
${DEST_DIR}         /home/ubuntu/scale-dir
${FILE}             file

*** Test Cases ***
Tc01: Create File artifact
    FOR    ${i}    IN RANGE    21    101
        KEY_SELECT_ARTIFACT_TYPE
        KEY_ENTER_ARTIFACT_NAME_AND_DEV_TYPE    ${i}
        KEY_ENTER_THE_PATH_AND_UPLOAD_FILE    ${i}
        KEY_DOWNLOAD_THE_FILE    ${i}
        KEY_START_AGAIN
    END

*** Keywords ****
KEY_SELECT_ARTIFACT_TYPE
    Wait Until Page Contains Element    xpath:/html/body/div/div/div[2]/div[1]/div/div[1]/div/div/div    #Artifact Type input filed
    Click Element    xpath:/html/body/div/div/div[2]/div[1]/div/div[1]/div/div/div

    #Select Artifact Type
    Wait Until Page Contains Element    xpath:/html/body/div[2]/div[3]      #Artifact selection dropdown list
    Click Element    xpath:/html/body/div[2]/div[3]/ul/li[1]                #Select File Type
    Sleep    2s
    Click Element    xpath:/html/body/div/div/div[2]/div[2]/button[2]       #Next Button

KEY_ENTER_ARTIFACT_NAME_AND_DEV_TYPE
    [Arguments]    ${i}
    Wait Until Page Contains Element    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div[1]/div/div    #Artifact name input field
    Click Element    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div[1]/div/div    #Artifact name input field
    Input Text    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div[1]/div/div/input    ${ARTIFACT_NAME}-${i}    #Artifact name input field
    Click Element    xpath:/html/body/div/div/div[2]/div[1]/div[2]/div[1]/div/div    #device_type input field
    input Text    xpath:/html/body/div/div/div[2]/div[1]/div[2]/div[1]/div/div/input    ${DEV_TYPE}    #device_type input field
    Click Element    xpath:/html/body/div/div/div[2]/div[2]/button[2]       #Next Button

KEY_ENTER_THE_PATH_AND_UPLOAD_FILE
    [Arguments]    ${i}
    Wait Until Page Contains Element    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div[1]/div/div/input    #Destination Dir path
    Click Element    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div[1]/div/div/input        #Destination Dir path
    Input Text    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div[1]/div/div/input    ${DEST_DIR}    #Destination Dir path

    ${x}=    Evaluate    ${i} % 3
    #Log To Console      File chosen is -> ${CURDIR}/${FILE}
    Choose File     id:uploadFile     ${CURDIR}/${FILE}-${x}.txt    #Upload file
    Sleep    2s

KEY_DOWNLOAD_THE_FILE
    [Arguments]    ${i}
    Click Element    xpath:/html/body/div/div/div[2]/div[2]/button[2]    #Submit Button
    Sleep    5s
    Log to Console      downloaded file ${ARTIFACT_NAME}-${i}.mender

KEY_START_AGAIN
    Wait Until Page Contains Element    xpath:/html/body/div/div/button    timeout=10s    #Start Again button
    Click Element    xpath:/html/body/div/div/button    #Start Again button
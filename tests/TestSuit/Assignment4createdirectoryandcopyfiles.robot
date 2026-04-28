*** Settings ***
Library    SeleniumLibrary 

Library    OperatingSystem

*** Variables ***
${BROWSER}           Chrome
${BASE_DIR}          ${CURDIR}/Test_Folder
${SUB_DIR}           ${BASE_DIR}/Backup
${SOURCE_FILE}       ${BASE_DIR}/sample.txt
${DESTINATION}       ${SUB_DIR}/copied_sample.txt

*** Test Cases ***
File System and Selenium Operations
    [Documentation]    Test case to create directories, write files, and copy them.
    
    # 1. Create Directory
    # 'Create Directory' will create the entire path if it doesn't exist
    Create Directory    ${SUB_DIR}
    Directory Should Exist    ${SUB_DIR}

    # 2. Create a dummy file to copy (Using OperatingSystem)
    Create File         ${SOURCE_FILE}    This is the content of the source file.
    File Should Exist   ${SOURCE_FILE}

    # 3. Copy File
    # Copy File <source> <destination>
    Copy File           ${SOURCE_FILE}    ${DESTINATION}
    File Should Exist   ${DESTINATION}
    
    Log To Console      \nDirectory and Copy operations successful!

    # 4. Integrate Selenium (Example: Uploading the copied file)
    Open Browser        https://the-internet.herokuapp.com/upload    ${BROWSER}
    Choose File         id:file-upload    ${DESTINATION}
    Click Button        id:file-submit
    Page Should Contain    File Uploaded!
    
    [Teardown]    Clean Up And Close

*** Keywords ***
Clean Up And Close
    # Good practice to remove test folders after execution
    Remove Directory    ${BASE_DIR}    recursive=True
    Close Browser
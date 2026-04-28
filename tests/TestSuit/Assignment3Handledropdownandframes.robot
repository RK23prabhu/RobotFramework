*** Settings ***
Library    SeleniumLibrary 

*** Variables ***
${URL_DROPDOWN}    https://the-internet.herokuapp.com/dropdown
${URL_FRAMES}      https://the-internet.herokuapp.com/frames
${URL_GOOGLE}      https://www.google.com
${BROWSER}         Chrome

*** Test Cases ***
Execute Selenium Advanced Elements
    [Documentation]    Testing Text, Values, Attributes, and JS Execution
    Open Browser    ${URL_GOOGLE}    ${BROWSER}
    Maximize Browser Window

    # 1. Execute Javascript (Scroll to bottom)
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)

    # 2. Get Element Count (Counting links on the page)
    ${link_count}    Get Element Count    xpath://a
    Log To Console    Total links found: ${link_count}

    # 3. Get Text (Retrieve text from a specific element)
    ${btn_text}    Get Text    xpath://div[@class='Kz9H9e']//div[1]
    Log To Console    Button text is: ${btn_text}

    # 4. Get Value (Retrieve input field value)
    Input Text    name:q    Robot Framework

    ${search_val}    Get Value    name:q
    Log To Console    Input value is: ${search_val}

    # 5. Get Element Attribute (Retrieve the 'name' attribute)
    ${attr}    Get Element Attribute    name:q    type

    Log To Console    Attribute type is: ${attr}

    # 6. Page Should Contain
    Page Should Contain    Images

    [Teardown]    Close Browser

Handle Dropdowns
    [Documentation]    Testing Index, Value, and Label selections
    Open Browser    ${URL_DROPDOWN}    ${BROWSER}
    
    # Select by Index (0-based)
    Select From List By Index    id:dropdown    1
    
    # Select by Value
    Select From List By Value    id:dropdown    2
    
    # Select by Label
    Select From List By Label    id:dropdown    Option 1
    
    [Teardown]    Close Browser

Handle Frames and Windows
    [Documentation]    Testing Select/Unselect Frame and Window switching
    Open Browser    ${URL_FRAMES}    ${BROWSER}
    Click Link      iFrame
    
    # 1. Select Frame
    Select Frame    id:mce_0_ifr
    Input Text      id:tinymce    Hello from inside the frame!
    
    # 2. Unselect Frame (Return to main content)
    Unselect Frame
    
    # 3. Switch Window
    Execute Javascript    window.open('https://www.bing.com')
    Switch Window    title:Bing
    Log To Console    Switched to Bing
    
    qac # 4. Close Window (Closes current active window)
    Close Window
    
    # Switch back to original
    Switch Window    main
    [Teardown]    Close Browser
*** Settings ***
Library     AppiumLibrary

*** Variables ***
${url}              http://localhost:4723/wd/hub
${deviceIOS}        iPhone 13 Pro Max
${app}              ${EXECDIR}/ios.app

*** Keywords ***
Start IOS
    Open Application    ${url}
    ...    automationName=XCUITest
    ...    platformName=ios
    ...    platformVersion=15.4
    ...    deviceName=${deviceIOS}
    ...    app=${app}
    ...    udid=10CE25C3-1E23-4884-8479-C93A85690116
    ...    autoGrantPermissions=true

Close App
    Capture Page Screenshot
    Close Application

*** Settings ***
Test Setup       Start IOS
Test Teardown    Close App

*** Test Cases ***
Test Case 001: login successfully
    Given im on the app
    # When accessing the app login page
    # Then i must login successfully

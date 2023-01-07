*** Settings ***
Library     AppiumLibrary

*** Variables ***
${url}              http://localhost:4723/wd/hub
${deviceAndroid}    Android Emulator
${apk}              ${EXECDIR}/android.apk

*** Keywords ***
Start Android
    Open Application    ${url}
    ...    automationName=UIAutomator2
    ...    platformName=Android
    ...    deviceName=${deviceAndroid}
    ...    app=${apk}
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true

Close App
    Capture Page Screenshot
    Close Application

*** Settings ***
Test Setup       Start Android
Test Teardown    Close App

*** Test Cases ***
Test Case 001: login successfully
    Given im on the app
    # When accessing the app login page
    # Then i must login successfully
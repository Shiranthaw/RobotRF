# keywords that can be reused
*** Settings ***
Library   SeleniumLibrary


*** Keywords ***
Utilities.Start browser and maximise
    [Arguments]   ${url}  ${Browser}
    open browser  ${url}  ${Browser}
    maximize browser window

Utilities.Close browser
    close browser
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#locators
${input_search}     id:gh-ac
${button_search}    id:gh-btn

*** Keywords ***
#page keywords
Homepage.Set search input
    [Arguments]    ${textToSearch}
    input text    ${input_search}    ${textToSearch}

Homepage.Click search button
    click element    ${button_search}

Homepage.Search for specific item
    [Arguments]    ${textToSearch}
    Homepage.Set search input    ${textToSearch}
    Homepage.Click search button

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${h1_resultCount}     xpath://h1[@class="srp-controls__count-heading"]
${search_listing1}    xpath://*[@id="srp-river-results-listing1"]//*[@class="s-item__link"]
${listed_price}       xpath://*[@id="srp-river-results-listing1"]//*[@class="s-item__price"]//*[@class="ITALIC"]

*** Keywords ***
ListingPage.Get result count
    ${extractedCount} =    get text    ${h1_resultCount}
    [Return]    ${extractedCount}

ListingPage.Click search result
    wait until element is visible   ${search_listing1}
    double click element  ${search_listing1}

ListingPage.Get item price
    wait until element is visible   ${listed_price}
    ${priceListed}=    get text  ${listed_price}
    [Return]  ${priceListed}


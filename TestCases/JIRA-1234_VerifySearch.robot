*** Settings ***
Resource    ../PageObjects/Homepage.robot
Resource    ../PageObjects/ListingPage.robot
Resource    ../Libraries/Utilities.robot
Resource    ../PageObjects/Itempage.robot
Resource    ../PageObjects/AddCartPopUpPage.robot

Test Setup
Test Teardown

*** Variables ***
${page_title}       Electronics, Cars, Fashion, Collectibles, Coupons and More | eBay
${cd_title}         Queen - Made In Heaven - CD, VG
${regex_pattern}    [0-9]+
${regex_price}      [0-9]+.[0-9]+
${listedSearchPrice}   #Local variable - Value is to be fetched and stored here



*** Test Cases ***
Navigate to web site and verify title
    open browser    http://www.ebay.com    firefox
    Utilities.Maximise browser
    title should be  ${page_title}
#    close browser

# each test should be independent
Verify search results
#    open browser    http://www.ebay.com    firefox
#    Utilities.Maximise browser
    Homepage.Search for specific item    ${cd_title}
    ${actualValue} =    ListingPage.Get result count
    should match regexp  ${actualValue}    ${regex_pattern}

Store listed item price
    ${priceListed}=      ListingPage.Get item price
    set global variable      ${listedSearchPrice}   ${priceListed}

Click on the first search listing
    ListingPage.Click search result

Verify item title
    ${displayedTitle}=   Itempage.Get item title
    should be equal as strings  ${displayedTitle}  ${cd_title}

Verify item price
    ${displayedPrice}=   Itempage.Get item price
    should be equal as strings    US ${listedSearchPrice}  ${displayedPrice}

Click add to cart
    Itempage.Click add to cart

#Click go to cart
#    AddToCartPopUp.Click go to cart

Close the browser
    Utilities.Close browser

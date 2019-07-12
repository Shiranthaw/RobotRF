#Contains page objects of seleted search item

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${item_title}  id:itemTitle
${item_price}  xpath://*[@id="convbinPrice"]

*** Keywords ***
Itempage.Get item title
    wait until element is visible  ${item_title}
    ${ttl}=     get text  ${item_title}
    [Return]   ${ttl}

Itempage.Get item price
    ${price}=   get text  ${item_price}
    [Return]   ${price}

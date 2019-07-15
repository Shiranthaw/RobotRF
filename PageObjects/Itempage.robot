#Contains page objects of seleted search item

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${item_title}  id:itemTitle
${item_price}  xpath://*[@id="convbinPrice"]
${add_to_cart}  id:atcRedesignId_btn


*** Keywords ***
Itempage.Get item title
    wait until element is visible  ${item_title}
    ${extractedTitle}=     get text  ${item_title}
    [Return]   ${extractedTitle}

Itempage.Get item price
    ${extractedPrice}=   get text  ${item_price}
    [Return]   ${extractedPrice}

Itempage.Click add to cart
    wait until element is visible  ${add_to_cart}
    click element   ${add_to_cart}
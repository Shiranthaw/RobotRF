#Intermidiate pop up that confirm adding the item to cart
*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${add_to_cart}    xpath://a[@href="https://cart.ebay.com?_trksid=p2484178.m4865.l8876"]
#div://*[@id="atcRedesignId_overlay-atc-container"]//*[@class="btn btn-scnd vi-VR-btnWdth-XL"]

*** Keywords ***
AddToCartPopUp.Click go to cart
    wait until element is visible  ${add_to_cart}
    click element   ${add_to_cart}
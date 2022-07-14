*** Settings ***
Documentation        This suite is for testing websites described for IQVIA interview
Resource            IQVIA_resources.robot
Test Setup           Open Browser to navigate
#Test Teardown        Close Browser

*** Test Cases ***

As an user, i must inform a valid username and password. Otherwise i cannot log in the system.
     [Documentation]     First test case for saucedemo website
     1 - As an user, go to the website Saucedemo.com
     2 - Go to the username field and fill with an user
     3 - Go to the password field and fill with a wrong password
     4 - Click on the Login button

As an user, i want to see items ordered by crescent price 
    [Documentation]    Second test case for saucedemo website
    1 - As an user, go to the saucedemo website
    2 - Inform a valid username and password and click on login
    3 - Click on the filter option on the top right corner of the screen and select price (low to high)
    4 - Scroll down and up to verify that the items are displayed from the lowest to the highest price.




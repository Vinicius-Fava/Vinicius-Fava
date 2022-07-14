*** Settings ***
Documentation        This suite is for testing websites described for IQVIA interview
Resource            IQVIA_resources.robot
Test Setup           Open Browser to navigate
#Test Teardown        Close Browser

*** Test Cases ***
As an user, i want to be able to search by transaction made
    [Documentation]    First test case for applitools website
    1 - Go to the website applitools
    2 - Perform a login with an username/password clicking on sign in.
    3 - Go to the search bar in the top right of the screen, click on it and type anything
    4 - The results must be displayed while typing, without any further action

As an user, i want to change my profile image
    [Documentation]    Second test case for applitools website
    1 - Go to https://demo.applitools.com/
    2 - inform an username, password and click on sign in
    3 - Go to the top right of the screen and click on the image



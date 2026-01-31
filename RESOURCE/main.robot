*** Settings ***
Library    Browser
Library    String

Resource   SHARED/setup_teardown.resource
Resource   PAGES/Main_pages.resource


#suites: setup and teardown
suite Setup    Access the YouTube website
suite Teardown    Close Browser


*** Variables ***



*** Keywords ***



****** Test Cases ***

Scenario 1: Entering the channel "${CHANNEL_NAME}" on YouTube

    [Tags]    enter_youtube

    Given I insert "${CHANNEL_NAME}" in youtube search bar
    When I press Enter
    And I click on the "${CHANNEL_NAME}"
    Then I get channel page

Scenario 2: Searching for videos on YouTube
# Each video separated by an ampersand (&) will be searched individually.
    [Tags]    search_videos
    Given I search for "${video_1 & video_2 & video 3 ...}" on youtube
    
    

Scenario 3: Choosing the first item from the list of recommendations
    [Tags]    choose_video
    Given chose the firt item from the list of recommendations "${SEARCH_FIRST_ITEM}"

Scenario 4: Watching videos on the shorts page on YouTube
    [Tags]    watch_shorts
    Given Open Shorts
    When I watch "${NUMBER_OF_SHORTS}" Shorts
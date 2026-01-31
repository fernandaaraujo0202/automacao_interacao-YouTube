
***settings***
Library    Browser
Resource   ../DATA/dados_site.resource


*** Keywords ***

Access the YouTube website
    New Browser
    ...    browser=${BROWSER}        
    ...    headless=${False}    
    ...    slowMo=2s    
    ...    args=["--start-maximized"]
    New Context    viewport=${None}    
    New Page    ${YOUTUBE_URL}
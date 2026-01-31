*** Settings ***
Library   Browser

*** Keywords ***

Open Shorts 
    Click    .style-scope ytd-guide-entry-renderer >> text="Shorts"


Wait for the video to end and go to the next one
    Wait For Elements State
    ...    css=div[role="slider"][aria-label="Controle deslizante de busca"]
    ...    attached
    ...    10s

    Wait For Function
    ...    el => Number(el.getAttribute("aria-valuenow")) > 95
    ...    css=div[role="slider"][aria-label="Controle deslizante de busca"]
    ...    timeout=60s

    Press Keys    body    ArrowDown

I watch "${NUM_VIDEOS}" Shorts

    FOR    ${INDEX}    IN RANGE    ${NUM_VIDEOS}
        wait for the video to end and go to the next one
    END
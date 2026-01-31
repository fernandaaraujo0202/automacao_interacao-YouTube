*** Settings ***

Library   Browser
Library   String



*** Keywords ***


# Scenario 1

I insert "${CHANNEL_NAME}" in youtube search bar
    fill Text    form[action="/results"]>> input    ${CHANNEL_NAME}

I press Enter 
    press Keys    form[action="/results"]>> input    Enter

I click on the "${CHANNEL_NAME}"
    Click      //yt-formatted-string[@id='text' and text()='${CHANNEL_NAME}']

I get channel page
    Get Text   [tab-title="Playlists"]    ==    Playlists



#Scenario 2

I search for "${VIDEOS_NAME}" on youtube 

    IF    "&" in $VIDEOS_NAME
        @{VIDEOS}    Split String    ${VIDEOS_NAME}    separator=&
        FOR    ${INDEX}    ${VIDEO}    IN ENUMERATE    @{VIDEOS}
            fill Text     form[action="/results"] >> input    ${VIDEO}
            press Keys    form[action="/results"] >> input    Enter
            research notification    ${INDEX}    @{VIDEOS}          
        END
    ELSE
        fill Text     form[action="/results"] >> input    ${VIDEOS_NAME}
        press Keys    form[action="/results"] >> input    Enter
    END

research notification
    [Arguments]    ${INDEX}    @{VIDEOS}
    
    ${numero}=    Evaluate    ${INDEX} + 1
    ${total}=    Get Length    ${VIDEOS}
     
        ${script}=    Catenate    SEPARATOR=\n
           ...    var old = document.getElementById("rf-toast");
            ...    if (old) { old.remove(); }
            ...    var div = document.createElement("div");
            ...    div.id = "rf-toast";
            ...    div.innerText = "Pesquisa ${NUMERO}/${TOTAL} realizada";
            ...    div.style.position = "fixed";
            ...    div.style.top = "10px";
            ...    div.style.left = "50%";
            ...    div.style.transform = "translateX(-50%)";
            ...    div.style.background = "Green";
            ...    div.style.color = "white";
            ...    div.style.padding = "10px";
            ...    div.style.zIndex = "9999";
            ...    div.style.borderRadius = "5px";
            ...    div.style.transition = "all 0.3s ease";
            ...    div.style.opacity = "0";
            ...    document.body.appendChild(div);
            ...    setTimeout(() => div.style.opacity = "1", 50);
            ...    document.body.appendChild(div);
            ...    setTimeout(function() { div.remove(); }, 3000);
            

            Evaluate JavaScript    ${None}    ${SCRIPT}
            Sleep    2s

#Cenário 3

chose the firt item from the list of recommendations "${VIDEO}"
    Fill Text    form[action="/results"] >> input    ${VIDEO}
    Get Element States  text="Denunciar previsões de pesquisa"
    Click    div[role="listbox"] >> div[role="presentation"] >> nth=0
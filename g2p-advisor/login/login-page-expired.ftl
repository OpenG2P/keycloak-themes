<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
        <div class="kc-info-page">
            <div class="kc-info-icon kc-info-icon--warn">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                          d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
            <p class="kc-info-message">${msg("pageExpiredMsg1")}
                <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a>
                ${msg("pageExpiredMsg2")}
                <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a>
                .
            </p>
        </div>
    </#if>
</@layout.registrationLayout>

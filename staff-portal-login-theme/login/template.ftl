<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- ✅ Your custom title -->
    <title>Staff Portal</title>
    <!-- OR dynamic -->
    <!-- <title>${msg("loginTitle", "Staff Portal")}</title> -->

    <link rel="icon" href="${url.resourcesPath}/img/favicon.png" type="image/png" />

    <!-- Keycloak default styles -->
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>

    <!-- Your custom CSS -->
    <link href="${url.resourcesPath}/css/styles.css" rel="stylesheet" />
</head>

<body class="${bodyClass!}">

    <#-- Show messages like errors -->
    <#if displayMessage && message?has_content>
        <div class="alert ${message.type}">
            ${kcSanitize(message.summary)?no_esc}
        </div>
    </#if>

    <#-- Main content injected from login.ftl -->
    <#nested "form">
</body>
</html>
</#macro>
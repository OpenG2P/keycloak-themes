<!DOCTYPE html>
<html <#if locale?? && locale.currentLanguageTag??>lang="${locale.currentLanguageTag}"</#if>>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="robots" content="noindex, nofollow"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/logo-mark.png"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${url.resourcesPath}/css/login.css"/>
</head>
<body>

<!-- ===== HEADER ===== -->
<header class="kc-header-bar">
    <a href="https://openg2p.org" target="_blank" rel="noopener noreferrer" class="kc-header-logo-link">
        <img src="${url.resourcesPath}/img/openg2p-logo.png"
             alt="OpenG2P"
             class="kc-header-logo-full"
             onerror="this.style.display='none'"/>
    </a>
</header>

<!-- ===== MAIN TWO-COLUMN LAYOUT ===== -->
<div class="kc-page-container">

    <!-- LEFT: Hero -->
    <div class="kc-hero-section">
        <h1 class="kc-hero-title">${msg("heroTitle")}</h1>
        <p class="kc-hero-subtitle">${msg("heroSubtitle")}</p>

        <!-- Bottom graphic replacing old icon grid + crane -->
        <div class="kc-hero-illustration">
            <img src="${url.resourcesPath}/img/login-page-graphics.png"
                 alt=""
                 class="kc-hero-graphic"
                 onerror="this.style.display='none'"/>
        </div>
    </div>

    <!-- RIGHT: Login Card -->
    <div class="kc-login-card">
        <div class="kc-login-card-inner">

            <!-- Logo -->
            <div class="kc-card-logo-wrap">
                <img src="${url.resourcesPath}/img/logo-mark.png" alt="Logo" class="kc-card-logo"
                     onerror="this.style.display='none'"/>
            </div>

            <!-- Titles -->
            <h2 class="kc-card-title">${msg("appName")}</h2>
            <p class="kc-card-subtitle">${msg("loginCardSubtitle")}</p>

            <!-- Flash message -->
            <#if message?has_content>
                <div class="kc-feedback kc-feedback--${message.type}">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <!-- ===== LOGIN FORM ===== -->
            <#if realm.password>
            <form id="kc-form-login" action="${url.loginAction}" method="post">

                <#-- Username field -->
                <#if !usernameHidden??>
                <div class="kc-form-group">
                    <label for="username" class="kc-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                        <#else>${msg("email")}
                        </#if>
                    </label>
                    <input id="username" name="username" type="text"
                           class="kc-input"
                           value="${(login.username!'')}"
                           autofocus autocomplete="username"
                           <#if messagesPerField.existsError('username','password')>aria-invalid="true"</#if>/>
                    <#if messagesPerField.existsError('username','password')>
                        <span class="kc-input-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                </div>
                </#if>

                <#-- Password field -->
                <div class="kc-form-group">
                    <label for="password" class="kc-label">${msg("password")}</label>
                    <div class="kc-input-group">
                        <input id="password" name="password" type="password"
                               class="kc-input"
                               autocomplete="current-password"
                               <#if messagesPerField.existsError('username','password')>aria-invalid="true"</#if>/>
                        <button type="button" class="kc-password-toggle"
                                onclick="togglePassword()" aria-label="${msg('showPassword')}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                 fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                            </svg>
                        </button>
                    </div>
                    <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <span class="kc-input-error" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <#-- Remember me + Forgot password -->
                <div class="kc-form-options">
                    <div>
                        <#if realm.rememberMe && !usernameHidden??>
                        <label class="kc-checkbox-label">
                            <input type="checkbox" name="rememberMe" id="rememberMe"
                                   <#if login.rememberMe??>checked</#if>>
                            ${msg("rememberMe")}
                        </label>
                        </#if>
                    </div>
                    <div>
                        <#if realm.resetPasswordAllowed>
                        <a href="${url.loginResetCredentialsUrl}" class="kc-forgot-link">
                            ${msg("doForgotPassword")}
                        </a>
                        </#if>
                    </div>
                </div>

                <input type="hidden" name="credentialId"
                       <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <button type="submit" id="kc-login" class="kc-btn-primary">
                    ${msg("doLogIn")}
                </button>

            </form>
            </#if>

            <#-- Social / Identity Providers -->
            <#if social?? && social.providers?? && social.providers?has_content>
            <div class="kc-social-divider"><span>${msg("identity-provider-login-label")}</span></div>
            <ul class="kc-social-list">
                <#list social.providers as p>
                <li>
                    <a href="${p.loginUrl}" class="kc-social-btn">
                        <#if p.iconClasses?has_content>
                            <i class="${p.iconClasses}" aria-hidden="true"></i>
                        </#if>
                        <span>${p.displayName!}</span>
                    </a>
                </li>
                </#list>
            </ul>
            </#if>

        </div>
    </div>
</div>

<!-- ===== FOOTER ===== -->
<footer class="kc-footer">
    <span class="kc-footer-copyright">${msg("footerCopyright")}</span>
    <div class="kc-footer-links">
        <#if realm.internationalizationEnabled && locale?? && locale.supported?has_content && (locale.supported?size > 1)>
            <#list locale.supported as l>
                <a href="${l.url}">${l.label}</a>
                <span class="kc-footer-sep">|</span>
            </#list>
        </#if>
        <a href="#">${msg("footerPrivacy")}</a>
        <span class="kc-footer-sep">|</span>
        <a href="#">${msg("footerContact")}</a>
    </div>
</footer>

<script>
    function togglePassword() {
        var p = document.getElementById('password');
        p.type = p.type === 'password' ? 'text' : 'password';
    }
</script>
</body>
</html>

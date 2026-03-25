<#import "template.ftl" as layout>

<@layout.registrationLayout bodyClass="openg2p-login" displayInfo=false displayMessage=false; section>
  <#if section == "form">

    <div class="page-wrapper">
      <div class="content-wrapper">

        <!-- LEFT PANEL -->
        <div class="left-panel">

          <h1>Welcome to OpenG2P</h1>

          <p class="description">
            OpenG2P enables governments and humanitarian organisations to deliver critical social benefits directly to those who need them.
          </p>

          <button class="contact-btn" onclick="window.open('https://www.openg2p.org/', '_blank')">
            <span>Get in touch</span>
            <span class="arrow">
              <img src="${url.resourcesPath}/img/arrow.svg" alt="arrow" />
            </span>
          </button>

          <img
            src="${url.resourcesPath}/img/login-illustration.png"
            class="left-image"
            alt="Illustration"
          />
        </div>

        <!-- RIGHT PANEL -->
        <div class="right-panel">
          <div class="login-card">

            <img
              src="${url.resourcesPath}/img/logo.svg"
              alt="OpenG2P Logo"
              class="logo"
            />

            <h2 class="title">Staff Portal</h2>

            <p class="subtitle">Log in to your account</p>

            <#if message?has_content>
              <div class="custom-message ${message.type}">
                ${kcSanitize(message.summary)?no_esc}
              </div>
            </#if>

            <form id="kc-form-login" action="${url.loginAction}" method="post">

              <div class="field">
                <label for="username">Email</label>
                <input
                  id="username"
                  type="text"
                  name="username"
                  value="${(login.username!'')}"
                  autocomplete="email"
                  required
                />
              </div>

              <div class="field">
                <label for="password">Password</label>
                <input
                  id="password"
                  type="password"
                  name="password"
                  autocomplete="current-password"
                  required
                />
              </div>

              <#if realm.resetPasswordAllowed>
                <div class="forgot-password-wrapper">
                  <a tabindex="5" class="forgot-password-link" href="${url.loginResetCredentialsUrl}">
                    ${msg("doForgotPassword")}
                  </a>
                </div>
              </#if>

              <button type="submit" class="login-btn">
                Log in
              </button>

              <div class="powered-by">
                <span>Powered by</span>
                <img
                  src="${url.resourcesPath}/img/keycloak.svg"
                  alt="Keycloak"
                  class="powered-logo"
                />
              </div>

            </form>

          </div>
        </div>

      </div>
    </div>

  </#if>
</@layout.registrationLayout>
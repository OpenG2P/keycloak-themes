<#import "template.ftl" as layout>

<@layout.registrationLayout bodyClass="openg2p-login" displayInfo=false displayMessage=true; section>
  <#if section == "form">

    <div class="page-wrapper">
      <div class="content-wrapper">

        <!-- LEFT PANEL -->
        <div class="left-panel">

          <h1>Welcome to OpenG2P</h1>

          <p class="description">
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry. Lorem Ipsum has been the industry's standard dummy text.
          </p>

          <button class="contact-btn">
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

            <p class="subtitle">Hello! Login your account</p>

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
                Login Now
              </button>

            </form>

          </div>
        </div>

      </div>
    </div>

  </#if>
</@layout.registrationLayout>
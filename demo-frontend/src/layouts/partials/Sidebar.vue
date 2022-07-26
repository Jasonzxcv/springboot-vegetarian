<script setup>
import { ref, watch, onMounted } from "vue";
import { useTemplateStore } from "@/stores/template";

import BaseNavigation from "@/components/BaseNavigation.vue";

// SimpleBar, for more info and examples you can check out https://github.com/Grsmto/simplebar/tree/master/packages/simplebar-vue
import SimpleBar from "simplebar";

// Grab menu navigation arrays 抓取nav陣列
import menu from "@/data/menu";

const navigation = menu.main;

// Main store 主要狀態
const store = useTemplateStore();

// Dark Mode preference helper for radios 夜視模式偏好
const radioDarkMode = ref();

// Sets default dark mode preferences for radios 設置默認為夜視模式
function setDarkModeRadioDefault() {
  if (store.settings.darkModeSystem) {
    radioDarkMode.value = "system";
  } else {
    if (store.settings.darkMode) {
      radioDarkMode.value = "dark";
    } else {
      radioDarkMode.value = "light";
    }
  }
}

// When the user sets dark mode preference through the radios 用戶設定夜視模式偏好
function onDarkModeRadioChange() {
  if (radioDarkMode.value === "system") {
    store.darkModeSystem({ mode: "on" });
  } else {
    store.darkModeSystem({ mode: "off" });

    if (radioDarkMode.value === "dark") {
      store.darkMode({ mode: "on" });
    } else {
      store.darkMode({ mode: "off" });
    }
  }
}

// Set dark mode preference radios default and watch for changes to store
setDarkModeRadioDefault();
watch(
  () => store.settings.darkModeSystem,
  () => {
    setDarkModeRadioDefault();
  }
);
watch(
  () => store.settings.darkMode,
  () => {
    setDarkModeRadioDefault();
  }
);

// Init SimpleBar (custom scrolling)
onMounted(() => {
  new SimpleBar(document.getElementById("simplebar-sidebar"));
});
</script>

<template>
  <!-- Sidebar -->
  <!--
    Sidebar Mini Mode - Display Helper classes

    Adding 'smini-hide' class to an element will make it invisible (opacity: 0) when the sidebar is in mini mode
    Adding 'smini-show' class to an element will make it visible (opacity: 1) when the sidebar is in mini mode
    If you would like to disable the transition animation, make sure to also add the 'no-transition' class to your element

    Adding 'smini-hidden' to an element will hide it when the sidebar is in mini mode
    Adding 'smini-visible' to an element will show it (display: inline-block) only when the sidebar is in mini mode
    Adding 'smini-visible-block' to an element will show it (display: block) only when the sidebar is in mini mode
  -->
  <nav id="sidebar" aria-label="Main Navigation">
    <slot>
      <!-- Side Header -->
      <div class="content-header">
        <slot name="header">
          <!-- Logo -->
          <RouterLink :to="{ name: 'index' }" class="fw-semibold text-dual">
            <span class="smini-visible">
              <i class="fa fa-bars text-primary"></i>
            </span>
            <span class="smini-hide fs-3 tracking-wider">
              <img src="/assets/media/vegan/logo.png" alt="..." class="w-75" />
            </span>
          </RouterLink>
          <!-- END Logo -->
        </slot>

        <!-- Extra -->
        <div>
          <slot name="header-extra">
            <!-- Dark Mode -->
            <div class="dropdown d-inline-block ms-1">
              <button
                type="button"
                class="btn btn-sm btn-alt-secondary"
                id="sidebar-dark-mode-dropdown"
                data-bs-toggle="dropdown"
                data-bs-auto-close="outside"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i v-if="!store.settings.darkMode" class="fa fa-adjust"></i>
                <i v-if="store.settings.darkMode" class="fa fa-adjust"></i>
              </button>
              <div
                class="dropdown-menu dropdown-menu-end dropdown-menu fs-sm smini-hide border-0"
                style="min-width: 8rem"
                aria-labelledby="sidebar-dark-mode-dropdown"
              >
                <div class="px-3 py-2 space-y-2">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      id="radio-dark-mode-off"
                      value="light"
                      v-model="radioDarkMode"
                      @change="onDarkModeRadioChange"
                    />
                    <label
                      class="form-check-label fw-medium"
                      for="radio-dark-mode-off"
                      >太陽</label
                    >
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      id="radio-dark-mode-on"
                      value="dark"
                      v-model="radioDarkMode"
                      @change="onDarkModeRadioChange"
                    />
                    <label
                      class="form-check-label fw-medium"
                      for="radio-dark-mode-on"
                      >月光</label
                    >
                  </div>
                  <div class="form-check mb-0">
                    <input
                      class="form-check-input"
                      type="radio"
                      id="radio-dark-mode-system"
                      value="system"
                      v-model="radioDarkMode"
                      @change="onDarkModeRadioChange"
                    />
                    <label
                      class="form-check-label fw-medium"
                      for="radio-dark-mode-system"
                      >沒人熟識</label
                    >
                  </div>
                </div>
              </div>
            </div>
            <!-- END Dark Mode -->

            <!-- Options -->
            <div class="dropdown d-inline-block ms-1">
              <button
                type="button"
                class="btn btn-sm btn-alt-secondary"
                id="sidebar-themes-dropdown"
                data-bs-toggle="dropdown"
                data-bs-auto-close="outside"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="fa fa-paint-brush"></i>
              </button>
              <div
                class="dropdown-menu dropdown-menu-end fs-sm smini-hide border-0"
                aria-labelledby="sidebar-themes-dropdown"
              >
                <!-- Color Themes -->
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center justify-content-between fw-medium"
                  @click="store.setColorTheme({ theme: '' })"
                >
                  <span>預設</span>
                  <i class="fa fa-circle text-default"></i>
                </button>
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center justify-content-between fw-medium"
                  @click="store.setColorTheme({ theme: 'amethyst' })"
                >
                  <span>紫水晶</span>
                  <i class="fa fa-circle text-amethyst"></i>
                </button>
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center justify-content-between fw-medium"
                  @click="store.setColorTheme({ theme: 'city' })"
                >
                  <span>城市</span>
                  <i class="fa fa-circle text-city"></i>
                </button>
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center justify-content-between fw-medium"
                  @click="store.setColorTheme({ theme: 'flat' })"
                >
                  <span>平淡</span>
                  <i class="fa fa-circle text-flat"></i>
                </button>
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center justify-content-between fw-medium"
                  @click="store.setColorTheme({ theme: 'modern' })"
                >
                  <span>現代</span>
                  <i class="fa fa-circle text-modern"></i>
                </button>
                <button
                  type="button"
                  class="dropdown-item d-flex align-items-center justify-content-between fw-medium"
                  @click="store.setColorTheme({ theme: 'smooth' })"
                >
                  <span>平滑</span>
                  <i class="fa fa-circle text-smooth"></i>
                </button>
                <!-- END Color Themes -->

                <div v-if="!store.settings.darkMode">
                  <div class="dropdown-divider"></div>

                  <!-- Sidebar Styles -->
                  <button
                    type="button"
                    class="dropdown-item fw-medium"
                    @click="store.sidebarStyle({ mode: 'light' })"
                  >
                    <span>左側邊欄高亮</span>
                  </button>
                  <button
                    type="button"
                    class="dropdown-item fw-medium"
                    @click="store.sidebarStyle({ mode: 'dark' })"
                  >
                    <span>側邊欄夜視</span>
                  </button>
                  <!-- END Sidebar Styles -->

                  <div class="dropdown-divider"></div>

                  <!-- Header Styles -->
                  <button
                    type="button"
                    class="dropdown-item fw-medium"
                    @click="store.headerStyle({ mode: 'light' })"
                  >
                    <span>標題欄高亮</span>
                  </button>
                  <button
                    type="button"
                    class="dropdown-item fw-medium"
                    @click="store.headerStyle({ mode: 'dark' })"
                  >
                    <span>標題欄夜視</span>
                  </button>
                  <!-- END Header Styles -->
                </div>
              </div>
            </div>
            <!-- END Options -->
          </slot>

          <!-- Close Sidebar, Visible only on mobile screens -->
          <button
            type="button"
            class="d-lg-none btn btn-sm btn-alt-secondary ms-1"
            @click="store.sidebar({ mode: 'close' })"
          >
            <i class="fa fa-fw fa-times"></i>
          </button>
          <!-- END Close Sidebar -->
        </div>
        <!-- END Extra -->
      </div>
      <!-- END Side Header -->

      <!-- Sidebar Scrolling -->
      <div id="simplebar-sidebar" class="js-sidebar-scroll">
        <slot name="content">
          <!-- Side Navigation -->
          <div class="content-side">
            <BaseNavigation :nodes="navigation" />
          </div>
          <!-- END Side Navigation -->
        </slot>
      </div>
      <!-- END Sidebar Scrolling -->
    </slot>
  </nav>
  <!-- END Sidebar -->
</template>

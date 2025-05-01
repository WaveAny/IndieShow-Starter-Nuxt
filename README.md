🌍 [English](./README.md) | [简体中文](./README-zh.md)

<div align="center">

# IndieShow

### IndieShow: 🚀 Boilerplate and Starter for indie Product Show for Nuxt 3, Tailwind CSS, and TypeScript.

Crafted with a focus on developer experience: 🖥️ Nuxt 3 + 🛠️ TypeScript + 🎨 Tailwind CSS + 🌐 i18n + 📄 markdown-it + 🔍 ESLint + 🧩 simple-git-hooks + 🧹 Lint-Staged + 📝 Commitlint + ☁️ Vercel.
Launch your global-ready web app with a sleek, performant, and SEO-optimized foundation.

[![CI](https://github.com/WaveAny/IndieShow-Starter-Nuxt/actions/workflows/ci.yml/badge.svg)](https://github.com/WaveAny/IndieShow-Starter-Nuxt/actions/workflows/ci.yml)
[![CD](https://github.com/WaveAny/IndieShow-Starter-Nuxt/actions/workflows/cd.yml/badge.svg)](https://github.com/WaveAny/IndieShow-Starter-Nuxt/actions/workflows/cd.yml)
[![GitHub license](https://img.shields.io/github/license/WaveAny/IndieShow-Starter-Nuxt)](https://github.com/WaveAny/IndieShow-Starter-Nuxt/blob/main/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/WaveAny/IndieShow-Starter-Nuxt)](https://github.com/WaveAny/IndieShow-Starter-Nuxt/stargazers)
[![Node Version](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen)](https://nodejs.org)
[![pnpm Version](https://img.shields.io/badge/pnpm-%3E%3D8.0.0-blue)](https://pnpm.io)
[![Nuxt Version](https://img.shields.io/badge/nuxt-3.15.4-00DC82.svg?logo=nuxt.js)](https://nuxt.com)

</div>

## 💡 Project Overview

IndieShow is a product showcase website template designed specifically for indie developers. Built with Nuxt 3 + TailwindCSS + TypeScript, you can create a professional product showcase website in minutes with simple configuration!

### 🎯 Use Cases

- 🏢 Product showcase for startups
- 👨‍💻 Portfolio for indie developers
- 🛠️ Quick start template for development

## ⚡ Performance

| Test Item                  | Score | Baseline |
| -------------------------- | ----- | -------- |
| Google PageSpeed (Mobile)  | 94    | > 90     |
| Google PageSpeed (Desktop) | 99    | > 90     |

<table>
  <tr>
    <td width="50%" align="center">
      <strong>Mobile Performance</strong>
      <br>
      <sub><img src="./public/assets/images/IndieShow-pagespeed-mobile.png?raw=true" alt="IndieShow-pagespeed-mobile"></sub>
    </td>
    <td width="50%" align="center">
      <strong>Desktop Performance</strong>
      <br>
      <sub><img src="./public/assets/images/IndieShow-pagespeed-pc.png?raw=true" alt="IndieShow-pagespeed-pc"></sub>
    </td>
  </tr>
</table>

## 🌈 Live Demo

- **Demo Site**: [https://indieshow-nuxt.waveany.com](https://indieshow-nuxt.waveany.com)
- **Documentation**: [View Docs](https://docs.indieshow.waveany.com/nuxt)

<p align="center">
  <a href="https://indieshow-nuxt.waveany.com"><img src="./public/assets/images/IndieShow-banner.png?raw=true" alt="IndieShow banner"></a>
  <a href="https://indieshow-nuxt.waveany.com"><img src="./public/assets/images/IndieShow-MyWorkWithFooter.png?raw=true" alt="IndieShow-MyWorkWithFooter"></a>
</p>

## 🛠️ Tech Stack

![Nuxt 3](https://img.shields.io/badge/-Nuxt.js-%232c3e50?style=for-the-badge&logo=Nuxt.js)
![Vue.js](https://img.shields.io/badge/-Vue.js-%232c3e50?style=for-the-badge&logo=Vue.js)
![TypeScript](https://img.shields.io/badge/-TypeScript-%23007ACC?style=for-the-badge&logo=TypeScript)
![TailwindCSS](https://img.shields.io/badge/-TailwindCSS-%231a202c?style=for-the-badge&logo=TailwindCSS)

## 📦 Project Structure

```bash
IndieShow/
├── components/        # Components Directory
│   ├── blocks/       # Block Components (Hero, Feature, ShowCase, CTA)
│   ├── common/       # Common Components (Theme Switch, Language Switch)
│   ├── layout/       # Layout Components (Header, Footer)
│   └── ui/           # UI Components (Back to Top, Progress Bar, QR Code Modal, etc.)
├── composables/      # Composables
│   ├── useLocale     # Language Switch
│   ├── useMarkdown   # Markdown Parser
│   └── useSeo        # SEO Optimization
├── config/           # Configuration Files
│   ├── nav          # Navigation Menu
│   ├── seo          # SEO Configuration
│   ├── showcase     # Work Showcase
│   ├── social       # Social Links
│   └── theme        # Theme Configuration
├── i18n/            # Internationalization
│   ├── en/          # English Language Pack
│   ├── zh/          # Chinese Language Pack
│   └── config.ts    # i18n Configuration
├── layouts/         # Layout Templates
├── pages/           # Page Files
│   ├── group.ts       # User Group Page
│   ├── index.ts       # Home Page
│   ├── privacy.ts     # Privacy Policy Page
│   ├── sales.ts       # Sales Terms Page
│   ├── terms.ts       # Terms of Service Page
├── plugins/         # Plugins Directory
│   └── analytics-google.client.ts  # Google Analytics
├── public/          # Static Assets
└── types/           # Type Definitions
```

## ✨ Core Features

### 🚀 Development Experience

- Using latest dependency versions with continuous updates
- Clean and elegant code with Composition API and `<script setup>`
- Complete TypeScript type support
- Integrated antfu/eslint-config for consistent code style

### 🎨 UI Design

- Responsive design based on TailwindCSS
- Light/Dark theme with system theme following
- Beautiful transitions and page effects
- Customizable theme colors

### 🌍 Internationalization

- English and Chinese support, easily extensible
- Automatic browser language detection
- Simple configuration, instant translation updates
- Automatic language prefix in URLs

### 📱 Multi-platform Adaptation

- Perfect adaptation for mobile and desktop
- PWA support, installable to home screen
- Optimized interaction for different devices

### 🔍 SEO Optimization

- SSR support based on Nuxt 3
- Automatic sitemap.xml generation
- Static page pre-rendering
- Complete Meta tag support
- Customizable page titles and descriptions

### ⚡️ Performance Optimization

- Automatic code splitting
- Smart component preloading
- Automatic image optimization
- On-demand icon loading

## 🚀 Quick Start

### Requirements

- Node.js ≥ 18.0
- pnpm ≥ 8.0

### Development Process

1. **Clone Project**

```bash
git clone https://github.com/WaveAny/IndieShow-Starter-Nuxt.git
cd IndieShow
pnpm install
```

2. **Configure Environment Variables**

```bash
cp .env.example .env
```

3. **Start Development Server**

```bash
pnpm dev
```

4. **Build and Deploy**

```bash
# Build for production
pnpm build

# Preview production build
pnpm preview
```

5. **One-Click Deploy**

Recommended deployment with Vercel:

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/WaveAny/IndieShow-Starter-Nuxt)

## 🤔 FAQ

<details>
<summary>1. How to customize themes?</summary>

Edit `config/theme.ts` file:

```ts
export const themeColors = {
  primary: {
    color: "indigo",
    hex: "#4f46e5",
    gradient: {
      dark: "#6366f1",
    },
  },
  gray: {
    color: "zinc",
  },
}
```

</details>

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Nuxt 3](https://nuxt.com) - Vue.js Full-stack Framework
- [Vue 3](https://vuejs.org) - Progressive JavaScript Framework
- [Tailwind CSS](https://tailwindcss.com) - Utility-First CSS Framework

## 📮 Contact

- GitHub Issues: [Submit Issues](https://github.com/WaveAny/IndieShow-Starter-Nuxt/issues)
- Email: <suppore@waveany.com>

## 📈 Project Statistics''

![Project Statistics](https://repobeats.axiom.co/api/embed/f6ac717e2e67eeb7c6d8ff113b93a77fc3c988b6.svg 'Repobeats analytics image')
''

## 🎨 Theme Preview

<table>
  <tr>
    <td width="50%" align="center">
      <strong>Light Theme</strong>
      <br>
      <sub><img height="300" src="./public/assets/images/IndieShow-light.png?raw=true" alt="IndieShow-light"></sub>
    </td>
    <td width="50%" align="center">
      <strong>Dark Theme</strong>
      <br>
      <sub><img height="300" src="./public/assets/images/IndieShow-dark.png?raw=true" alt="IndieShow-dark"></sub>
    </td>
  </tr>
</table>

## 📈 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=WaveAny/IndieShow-Starter-Nuxt&type=Date)](https://star-history.com/#WaveAny/IndieShow-Starter-Nuxt&Date)

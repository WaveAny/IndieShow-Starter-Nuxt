import { defineI18nLocale } from "#i18n"

// 性能优化，按需加载;启用命名空间;

export default defineI18nLocale(async () => ({
  site: await import("./site.json").then(r => r.default),
  components: await import("./components.json").then(r => r.default),
  cta: await import("./cta.json").then(r => r.default),
  features: await import("./features.json").then(r => r.default),
  footer: await import("./footer.json").then(r => r.default),
  nav: await import("./nav.json").then(r => r.default),
  showcase: await import("./showcase.json").then(r => r.default),
  seo: await import("./seo.json").then(r => r.default),
  group: await import("./group.json").then(r => r.default),
  pricing: await import("./pricing.json").then(r => r.default),
}))

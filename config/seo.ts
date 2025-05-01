import type { SEOConfig, TwitterCard } from "~/types/config/seo"
import { useRuntimeConfig } from "#imports"

// 获取运行时配置中的 siteUrl
function getSiteUrl() {
  const { public: { siteUrl } } = useRuntimeConfig()
  return siteUrl || ""
}

// 处理 URL 路径
const normalizeUrl = (path: string) => path.startsWith("/") ? path : `/${path}`

export const seoConfig: SEOConfig = {

  // 默认 SEO 配置
  defaults: {
    titleTemplate: `%s - ${process.env.NUXT_PUBLIC_SITE_NAME}`,
    author: "IndieShow Team",
    ogImage: "/images/social/og-image.svg",
  },

  // 社交媒体配置
  social: {
    twitter: {
      card: "summary_large_image" as TwitterCard,
      creator: "@IndieShow",
      site: "@IndieShow",
    },
    facebook: {
      appId: "", // 如果有 Facebook 应用，可以在这里配置
    },
  },

  // 预定义的页面名称，用于 i18n 查找
  pages: ["home", "privacy", "terms", "group", "sales", "pricing"],

  // 获取站点 URL
  getSiteUrl,

  // 生成完整 URL
  generateUrl: (path: string) => {
    const siteUrl = getSiteUrl()
    return `${siteUrl}${normalizeUrl(path)}`
  },

  // 生成完整的图片 URL
  generateImageUrl: (imagePath: string): string => {
    if (imagePath.startsWith("http")) {
      return imagePath
    }
    const siteUrl = getSiteUrl()
    return `${siteUrl}${normalizeUrl(imagePath)}`
  },
}

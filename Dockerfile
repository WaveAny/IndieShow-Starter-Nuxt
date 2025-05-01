# 使用固定版本标签，避免使用 latest
# 定义基础镜像版本
ARG NODE_VERSION=22.14.0
ARG ALPINE_VERSION=3.21
ARG PNPM_VERSION=10.4.1

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION} AS deps
WORKDIR /app

# 只复制依赖相关文件，提高缓存命中率
COPY package.json pnpm-lock.yaml ./

# 安装 pnpm 并设置依赖
RUN npm i -g corepack@latest && \
    corepack enable && \
    corepack prepare pnpm@${PNPM_VERSION} --activate && \
    pnpm i --frozen-lockfile --ignore-scripts && \
    # 清理缓存
    pnpm store prune && \
    rm -rf /root/.npm /root/.pnpm-store /tmp/*

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION} AS builder
WORKDIR /app

# 定义构建参数
ARG NUXT_PUBLIC_SITE_URL
ARG NUXT_PUBLIC_SITE_NAME
ARG NUXT_PUBLIC_GA_ID
ARG NUXT_PUBLIC_API_BASE
ARG NUXT_PUBLIC_TYPEWRITER_ENABLED
ARG NUXT_PUBLIC_TYPEWRITER_SPEED
ARG NUXT_PUBLIC_UMAMI_WEBSITE_ID
ARG NUXT_PUBLIC_PLAUSIBLE_DOMAIN
ARG NUXT_PUBLIC_OP_CLIENT_ID
ARG NUXT_PUBLIC_BAIDU_ID

# 复制依赖
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# 设置环境变量
ENV NODE_ENV=production \
    NUXT_PUBLIC_SITE_URL=${NUXT_PUBLIC_SITE_URL} \
    NUXT_PUBLIC_SITE_NAME=${NUXT_PUBLIC_SITE_NAME} \
    NUXT_PUBLIC_GA_ID=${NUXT_PUBLIC_GA_ID} \      
    NUXT_PUBLIC_API_BASE=${NUXT_PUBLIC_API_BASE} \
    NUXT_PUBLIC_TYPEWRITER_ENABLED=${NUXT_PUBLIC_TYPEWRITER_ENABLED} \
    NUXT_PUBLIC_TYPEWRITER_SPEED=${NUXT_PUBLIC_TYPEWRITER_SPEED} \    
    NUXT_PUBLIC_UMAMI_WEBSITE_ID=${NUXT_PUBLIC_UMAMI_WEBSITE_ID} \
    NUXT_PUBLIC_PLAUSIBLE_DOMAIN=${NUXT_PUBLIC_PLAUSIBLE_DOMAIN} \
    NUXT_PUBLIC_OP_CLIENT_ID=${NUXT_PUBLIC_OP_CLIENT_ID} \
    NUXT_PUBLIC_BAIDU_ID=${NUXT_PUBLIC_BAIDU_ID} \
    NUXT_TELEMETRY_DISABLED=1

# 构建应用
RUN npm i -g corepack@latest && \
    corepack enable && \
    corepack prepare pnpm@${PNPM_VERSION} --activate && \
    pnpm build

FROM node:${NODE_VERSION}-alpine${ALPINE_VERSION} AS runner
WORKDIR /app

# 安装必要的安全更新和工具
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    && rm -rf /var/cache/apk/*

# 创建非 root 用户
RUN addgroup --system --gid 1001 nodejs && \
    adduser --system --uid 1001 nuxtjs

# 设置生产环境
ENV NODE_ENV=production \
    NUXT_TELEMETRY_DISABLED=1 \
    PORT=3000 \
    # 设置 Node.js 环境参数
    NODE_OPTIONS="--max-old-space-size=8192"

# 从 builder 阶段复制构建产物
COPY --from=builder /app/.output ./.output

# 设置安全相关配置
RUN chmod -R 550 ./.output && \
    chmod -R 770 ./.output/public && \
    # 删除不必要的文件
    rm -rf /tmp/* /var/cache/apk/* && \
    # 设置目录所有权
    chown -R nuxtjs:nodejs .

# 切换到非 root 用户
USER nuxtjs

# 添加标签
LABEL maintainer="support@waveany.com" \
      version="1.0.0" \
      description="IndieShow" \
      node.version="${NODE_VERSION}"

EXPOSE ${PORT}

# 使用 exec 格式的 CMD
CMD ["node", ".output/server/index.mjs"]

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from "vue"

import { useI18n } from "#imports"
import { useSeo } from "~/composables/useSeo"

const { t } = useI18n()
const { updatePageSeo } = useSeo()

// 更新页面的 SEO 信息
updatePageSeo("pricing")

// 倒计时相关
const PROMOTION_END_DATE = new Date("2099-04-20T23:59:59") // 设置优惠活动截止时间
const countdown = ref({
  days: "00",
  hours: "00",
  minutes: "00",
  seconds: "00",
})

let timer: ReturnType<typeof setInterval> | null = null

function updateCountdown() {
  const now = new Date().getTime()
  const distance = PROMOTION_END_DATE.getTime() - now

  if (distance < 0) {
    if (timer)
      clearInterval(timer)
    countdown.value = {
      days: "00",
      hours: "00",
      minutes: "00",
      seconds: "00",
    }
    return
  }

  const days = Math.floor(distance / (1000 * 60 * 60 * 24))
  const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
  const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
  const seconds = Math.floor((distance % (1000 * 60)) / 1000)

  countdown.value = {
    days: days.toString().padStart(2, "0"),
    hours: hours.toString().padStart(2, "0"),
    minutes: minutes.toString().padStart(2, "0"),
    seconds: seconds.toString().padStart(2, "0"),
  }
}

onMounted(() => {
  updateCountdown() // 立即更新一次
  timer = setInterval(updateCountdown, 1000)
})

onUnmounted(() => {
  if (timer)
    clearInterval(timer)
})

// FAQ 接口
interface FaqItem {
  question: string
  answer: string
  isOpen: boolean
}

// 定义价格方案
const plans = [
  {
    name: "Free",
    price: 0,
    originalPrice: 0,
    description: t("pricing.free_desc"),
    features: [
      "pricing.feature.quick_deploy",
      "pricing.feature.responsive",
      "pricing.feature.basic_theme",
      "pricing.feature.bilingual",
      "pricing.feature.basic_seo",
      "pricing.feature.no_auth",
      "pricing.feature.no_payment",
      "pricing.feature.no_support",
    ],
    buttonText: "pricing.get_free",
    popular: false,
  },
  {
    name: "Standard",
    price: 166,
    originalPrice: 199,
    description: t("pricing.standard_desc"),
    features: [
      "pricing.feature.all_free",
      "pricing.feature.auth_system",
      "pricing.feature.payment_system",
      "pricing.feature.advanced_theme",
      "pricing.feature.multilingual",
      "pricing.feature.animations",
      "pricing.feature.pwa",
      "pricing.feature.advanced_seo",
      "pricing.feature.first_launch_support",
      "pricing.feature.lifetime_updates",
    ],
    buttonText: "pricing.get_standard",
    popular: true,
  },
  {
    name: "Premium",
    price: 266,
    originalPrice: 399,
    description: t("pricing.premium_desc"),
    features: [
      "pricing.feature.all_standard",
      "pricing.feature.priority_support",
      "pricing.feature.custom_domain",
      "pricing.feature.performance",
      "pricing.feature.lifetime_updates",
    ],
    buttonText: "pricing.get_premium",
    popular: false,
  },
]

// 用户评价
const testimonials = [
  {
    content: t("pricing.testimonials.items.0.content"),
    author: t("pricing.testimonials.items.0.author"),
    role: t("pricing.testimonials.items.0.role"),
  },
  {
    content: t("pricing.testimonials.items.1.content"),
    author: t("pricing.testimonials.items.1.author"),
    role: t("pricing.testimonials.items.1.role"),
  },
]

// 购买保障
const guaranteeItems = [
  {
    title: t("pricing.guarantee.items.0.title"),
    desc: t("pricing.guarantee.items.0.desc"),
  },
  {
    title: t("pricing.guarantee.items.1.title"),
    desc: t("pricing.guarantee.items.1.desc"),
  },
  {
    title: t("pricing.guarantee.items.2.title"),
    desc: t("pricing.guarantee.items.2.desc"),
  },
]

// FAQ 数据
const faqItems = ref<FaqItem[]>([
  {
    question: t("pricing.faq.items.0.q"),
    answer: t("pricing.faq.items.0.a"),
    isOpen: false,
  },
  {
    question: t("pricing.faq.items.1.q"),
    answer: t("pricing.faq.items.1.a"),
    isOpen: false,
  },
  {
    question: t("pricing.faq.items.2.q"),
    answer: t("pricing.faq.items.2.a"),
    isOpen: false,
  },
  {
    question: t("pricing.faq.items.3.q"),
    answer: t("pricing.faq.items.3.a"),
    isOpen: false,
  },
  {
    question: t("pricing.faq.items.4.q"),
    answer: t("pricing.faq.items.4.a"),
    isOpen: false,
  },
])
</script>

<template>
  <div class="flex min-h-screen flex-col">
    <main class="flex-1">
      <section
        class="relative overflow-hidden bg-gradient-to-b from-white via-gray-50/80 to-white py-24 dark:from-gray-900 dark:via-gray-800/95 dark:to-gray-900 sm:py-32 transition-colors duration-200"
      >
        <div class="container relative mx-auto px-4 sm:px-6 lg:px-8">
          <!-- 页面标题 -->
          <UIScrollAnimation animation="fade-down" :duration="1000">
            <div class="mx-auto max-w-4xl text-center">
              <h1
                class="bg-gradient-to-r from-primary-600 via-primary-500 to-primary-600 bg-clip-text text-4xl font-extrabold tracking-tight text-transparent sm:text-5xl"
              >
                <ClientOnly>
                  {{ t('pricing.title') }}
                </ClientOnly>
              </h1>
              <p class="mt-6 text-lg leading-8 text-gray-600 dark:text-gray-300">
                <ClientOnly>
                  {{ t('pricing.subtitle') }}
                </ClientOnly>
              </p>

              <!-- 倒计时 -->
              <div class="mt-8">
                <h3 class="text-xl font-semibold text-primary-600 dark:text-primary-400">
                  <ClientOnly>
                    {{ t('pricing.countdown.title') }}
                  </ClientOnly>
                </h3>
                <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
                  <ClientOnly>
                    {{ t('pricing.countdown.subtitle') }}
                  </ClientOnly>
                </p>
                <div
                  class="mt-4 inline-flex items-center gap-4 rounded-xl bg-primary-50 px-6 py-3 dark:bg-primary-500/10"
                >
                  <div
                    v-for="(value, key) in countdown" :key="key"
                    class="flex flex-col items-center rounded-lg bg-white px-3 py-2 shadow-sm dark:bg-gray-800"
                  >
                    <span class="text-2xl font-bold text-primary-600 dark:text-primary-400 tabular-nums">{{ value
                    }}</span>
                    <span class="text-xs text-gray-500 dark:text-gray-400">
                      <ClientOnly>
                        {{ t(`pricing.countdown.${key}`) }}
                      </ClientOnly>
                    </span>
                  </div>
                </div>
              </div>

              <!-- 用户数量展示 -->
              <p
                class="mt-8 inline-flex items-center rounded-full bg-primary-50 px-4 py-2 text-sm font-medium text-primary-700 ring-1 ring-inset ring-primary-600/20 dark:bg-primary-500/10 dark:text-primary-400 dark:ring-primary-400/20"
              >
                <UIcon name="i-lucide-users" class="mr-2 h-4 w-4" />
                <ClientOnly>
                  {{ t('pricing.users_count') }}
                </ClientOnly>
              </p>
            </div>
          </UIScrollAnimation>

          <!-- 价格卡片 -->
          <UIScrollAnimation animation="fade-up" :duration="1200" :delay="400">
            <div class="mx-auto mt-16 grid max-w-7xl grid-cols-1 gap-6 sm:gap-8 md:grid-cols-2 lg:grid-cols-3">
              <template v-for="plan in plans" :key="plan.name">
                <div
                  class="relative flex flex-col rounded-3xl bg-white p-6 sm:p-8 shadow-xl dark:bg-gray-800/50 ring-1 transition-all duration-200 hover:shadow-2xl transform hover:scale-[1.02]" :class="[
                    plan.popular
                      ? 'ring-primary-500 dark:ring-primary-400'
                      : 'ring-gray-200 dark:ring-gray-700',
                  ]"
                >
                  <!-- Popular badge -->
                  <div
                    v-if="plan.popular"
                    class="absolute -top-4 left-1/2 -translate-x-1/2 rounded-full bg-primary-500 px-4 py-1 text-sm font-semibold text-white shadow-sm"
                  >
                    <ClientOnly>
                      {{ t('pricing.most_popular') }}
                    </ClientOnly>
                  </div>

                  <!-- Limited time offer -->
                  <div
                    class="absolute -right-2 top-4 rotate-12 rounded-lg bg-yellow-500 px-3 py-1 text-sm font-semibold text-white shadow-lg"
                  >
                    <ClientOnly>
                      {{ t('pricing.limited_time') }}
                    </ClientOnly>
                  </div>

                  <div class="mb-6">
                    <h3 class="text-2xl font-bold text-gray-900 dark:text-white">
                      {{ plan.name }}
                    </h3>
                    <p class="mt-4 text-gray-600 dark:text-gray-300">
                      <ClientOnly>
                        {{ t(plan.description) }}
                      </ClientOnly>
                    </p>
                    <!-- 价格展示 -->
                    <div class="mt-6 flex items-baseline gap-2">
                      <span class="text-4xl font-bold tracking-tight text-gray-900 dark:text-white">${{ plan.price
                      }}</span>
                      <span class="ml-2 text-sm text-gray-500 line-through dark:text-gray-400">${{ plan.originalPrice
                      }}</span>
                      <span class="text-sm text-green-600 dark:text-green-400">
                        {{ t('pricing.save_amount') }} ${{ plan.originalPrice - plan.price }}
                      </span>
                    </div>
                    <!-- 满意保证 -->
                    <p class="mt-2 flex items-center text-sm text-gray-500 dark:text-gray-400">
                      <UIcon name="i-lucide-shield-check" class="mr-1 h-4 w-4 text-green-500" />
                      {{ t('pricing.satisfaction') }}
                    </p>
                  </div>

                  <!-- Features -->
                  <ul class="mb-8 space-y-4 flex-1">
                    <li
                      v-for="feature in plan.features" :key="feature"
                      class="flex items-center gap-3 text-gray-600 dark:text-gray-300"
                    >
                      <UIcon name="i-lucide-check" class="h-5 w-5 flex-shrink-0 text-primary-500" />
                      <ClientOnly>
                        {{ t(feature) }}
                      </ClientOnly>
                    </li>
                  </ul>

                  <!-- Action button -->
                  <UButton
                    size="xl" :color="plan.popular ? 'primary' : 'white'"
                    :variant="plan.popular ? 'solid' : 'outline'" :ui="{
                      rounded: 'rounded-full',
                      padding: {
                        xl: 'px-8 py-4',
                      },
                      font: 'font-bold',
                      base: 'w-full flex items-center justify-center',
                    }" class="group w-full transition-all duration-200 hover:shadow-xl hover:scale-[1.02]"
                  >
                    <span class="inline-flex items-center justify-center gap-2 w-full">
                      <ClientOnly>
                        {{ t(plan.buttonText) }}
                      </ClientOnly>
                      <UIcon
                        name="i-lucide-arrow-right"
                        class="h-5 w-5 transition-transform duration-300 group-hover:translate-x-1"
                      />
                    </span>
                  </UButton>
                </div>
              </template>
            </div>
          </UIScrollAnimation>

          <!-- 购买保障 -->
          <UIScrollAnimation animation="fade-up" :duration="1200" :delay="600">
            <div class="mx-auto mt-24 max-w-5xl">
              <h2 class="text-center text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
                <ClientOnly>
                  {{ t('pricing.guarantee.title') }}
                </ClientOnly>
              </h2>
              <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
                <div
                  v-for="(item, index) in guaranteeItems" :key="index"
                  class="flex flex-col items-center rounded-2xl bg-white p-8 text-center shadow-lg dark:bg-gray-800/50"
                >
                  <div
                    class="flex h-16 w-16 items-center justify-center rounded-full bg-primary-50 dark:bg-primary-500/10"
                  >
                    <UIcon
                      :name="[
                        'i-lucide-shield-check',
                        'i-lucide-credit-card',
                        'i-lucide-clock',
                      ][index]" class="h-8 w-8 text-primary-600 dark:text-primary-400"
                    />
                  </div>
                  <h3 class="mt-6 text-lg font-semibold text-gray-900 dark:text-white">
                    {{ item.title }}
                  </h3>
                  <p class="mt-2 text-gray-600 dark:text-gray-300">
                    {{ item.desc }}
                  </p>
                </div>
              </div>
            </div>
          </UIScrollAnimation>

          <!-- 用户评价 -->
          <UIScrollAnimation animation="fade-up" :duration="1200" :delay="800">
            <div class="mx-auto mt-24 max-w-5xl">
              <h2 class="text-center text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
                <ClientOnly>
                  {{ t('pricing.testimonials.title') }}
                </ClientOnly>
              </h2>
              <div class="mt-12 grid gap-8 sm:grid-cols-2">
                <div
                  v-for="(testimonial, index) in testimonials" :key="index"
                  class="relative rounded-2xl bg-white p-8 shadow-lg dark:bg-gray-800/50"
                >
                  <div class="absolute -top-4 -left-4">
                    <span class="text-6xl text-primary-200 dark:text-primary-800">"</span>
                  </div>
                  <p class="relative text-lg text-gray-600 dark:text-gray-300">
                    {{ testimonial.content }}
                  </p>
                  <div class="mt-6">
                    <p class="font-semibold text-gray-900 dark:text-white">
                      {{ testimonial.author }}
                    </p>
                    <p class="text-sm text-gray-500 dark:text-gray-400">
                      {{ testimonial.role }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </UIScrollAnimation>

          <!-- FAQ -->
          <UIScrollAnimation animation="fade-up" :duration="1200" :delay="1000">
            <div class="mx-auto mt-24 max-w-5xl">
              <div class="text-center">
                <h2 class="text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
                  <ClientOnly>
                    {{ t('pricing.faq.title') }}
                  </ClientOnly>
                </h2>
                <p class="mt-4 text-lg text-gray-600 dark:text-gray-300">
                  <ClientOnly>
                    {{ t('pricing.faq.desc') }}
                  </ClientOnly>
                </p>
              </div>
              <div class="mt-12">
                <div class="space-y-4">
                  <div
                    v-for="(item, index) in faqItems" :key="index"
                    class="rounded-2xl bg-white p-6 shadow-lg transition-all duration-200 hover:shadow-xl dark:bg-gray-800/50"
                  >
                    <button
                      class="flex w-full items-center justify-between text-left" :aria-expanded="item.isOpen"
                      @click="item.isOpen = !item.isOpen"
                    >
                      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                        {{ item.question }}
                      </h3>
                      <UIcon
                        :name="item.isOpen ? 'i-lucide-minus-circle' : 'i-lucide-plus-circle'"
                        class="h-6 w-6 flex-shrink-0 text-primary-500 transition-all duration-500"
                        :class="{ '-rotate-180 transform': item.isOpen }"
                      />
                    </button>
                    <transition
                      enter-active-class="transition-all duration-500 ease-in-out"
                      enter-from-class="opacity-0 max-h-0 -translate-y-4"
                      enter-to-class="opacity-100 max-h-[1000px] translate-y-0"
                      leave-active-class="transition-all duration-300 ease-in-out"
                      leave-from-class="opacity-100 max-h-[1000px] translate-y-0"
                      leave-to-class="opacity-0 max-h-0 -translate-y-4"
                    >
                      <div v-show="item.isOpen" class="mt-4 overflow-hidden">
                        <p class="text-gray-600 dark:text-gray-300 transition-all duration-500 ease-in-out">
                          {{
                            item.answer }}
                        </p>
                      </div>
                    </transition>
                  </div>
                </div>
              </div>
            </div>
          </UIScrollAnimation>
        </div>
      </section>
    </main>
  </div>
</template>

<style scoped>
/* 添加数字切换动画 */
.tabular-nums {
  font-variant-numeric: tabular-nums;
  transition: all 0.3s ease-in-out;
}

/* 保持其他样式不变 */
.qr-scan-animation {
  height: 100%;
  animation: scan 3s cubic-bezier(0.4, 0, 0.2, 1) infinite;
}

@keyframes scan {
  0% {
    transform: translateY(-100%);
    opacity: 0;
  }

  25% {
    opacity: 1;
  }

  75% {
    opacity: 1;
  }

  100% {
    transform: translateY(100%);
    opacity: 0;
  }
}
</style>

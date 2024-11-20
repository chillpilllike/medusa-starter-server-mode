import { loadEnv, defineConfig } from '@medusajs/framework/utils'
import { Modules } from "@medusajs/framework/utils" // Added Modules import

// Load environment variables
loadEnv(process.env.NODE_ENV || 'development', process.cwd())

module.exports = defineConfig({
  projectConfig: {
    databaseUrl: process.env.DATABASE_URL,
    redisUrl: process.env.REDIS_URL, // Added redisUrl
    workerMode: process.env.MEDUSA_WORKER_MODE as "shared" | "worker" | "server", // Added workerMode
    http: {
      storeCors: process.env.STORE_CORS!,
      adminCors: process.env.ADMIN_CORS!,
      authCors: process.env.AUTH_CORS!,
      jwtSecret: process.env.JWT_SECRET || "supersecret",
      cookieSecret: process.env.COOKIE_SECRET || "supersecret",
    },
  },
  admin: { // Added admin configuration
    backendUrl: process.env.MEDUSA_BACKEND_URL,
  },
  modules: [ // Added modules configuration
    {
      resolve: "@medusajs/medusa/event-bus-redis",
      options: {
        redisUrl: process.env.EVENTS_REDIS_URL,
      },
    },
    {
      resolve: "@medusajs/medusa/workflow-engine-redis",
      options: {
        redis: {
          url: process.env.WE_REDIS_URL,
        },
      },
    },
  ],
})

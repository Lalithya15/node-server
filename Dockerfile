# ---------- Stage 1: Builder ----------
FROM node:18-alpine AS builder

WORKDIR /app

# Copy only package files first (this helps with caching)
COPY package*.json ./

# Use faster npm flag and skip optional deps
RUN npm install --omit=optional --no-audit --no-fund

# Copy rest of project files
COPY . .

# Disable Turbopack to save memory
ENV NEXT_PRIVATE_TURBOPACK=false

# Build the app
RUN npm run build

# ---------- Stage 2: Runner ----------
FROM node:18-alpine AS runner
WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package*.json ./

# Install only production deps
RUN npm install --omit=dev --no-audit --no-fund

# Expose app port
EXPOSE 5000

# Start Next.js
CMD ["npx", "next", "start", "-p", "5000", "-H", "0.0.0.0"]

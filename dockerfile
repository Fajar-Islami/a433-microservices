# Stage 1: Build the application
FROM node:14-alpine

# Membuat directory baru bernama app di dalam container dan menjadikannya sebagai working directory. 
WORKDIR /app

# Copy direktori saat ini ke /app
COPY . .

# agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-dbsebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# Running dengan command npm start
CMD ["npm", "start"]

# Expose port 8080
EXPOSE 8080
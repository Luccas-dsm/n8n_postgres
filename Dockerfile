# Etapa 1: Usar uma imagem base com Node.js mais recente
FROM node:latest AS build

# Definir diretório de trabalho
WORKDIR /app

# Instalar n8n globalmente
RUN npm install -g n8n

# Expor a porta do n8n
EXPOSE 5678

# Definir as variáveis de ambiente para o n8n
ENV N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=user \
    N8N_BASIC_AUTH_PASSWORD=pass \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678

# Comando para iniciar o n8n
CMD ["n8n"]

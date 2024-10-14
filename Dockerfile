FROM n8nio/n8n:latest

USER node

# Criação do diretório para os nós
RUN mkdir -p /home/node/.n8n/nodes

# Definindo o diretório de trabalho
WORKDIR /home/node/.n8n/nodes 

# Instalando os nós personalizados
RUN npm install n8n-nodes-chatwoot n8n-nodes-text-manipulation

# Defina as variáveis de ambiente
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=${POSTGRES_DATABASE}
ENV DB_POSTGRESDB_HOST=${POSTGRES_HOST}
ENV DB_POSTGRESDB_PORT=${POSTGRES_PORT}
ENV DB_POSTGRESDB_USER=${POSTGRES_USER}
ENV DB_POSTGRESDB_SCHEMA=${POSTGRES_SCHEMA}
ENV DB_POSTGRESDB_PASSWORD=${POSTGRES_PASSWORD}
ENV N8N_ENCRYPTION_KEY=${ENCRYPTION_KEY}

# Expondo a porta padrão do n8n
EXPOSE 5678

# Comando para iniciar o n8n
CMD ["n8n", "start"]

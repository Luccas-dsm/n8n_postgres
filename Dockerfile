# Usando a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Defina as variáveis de ambiente
# Os valores das variáveis serão passados pelo Railway
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

# Definindo o volume para persistir dados
VOLUME /home/node/.n8n

# Comando para iniciar o n8n
CMD ["n8n", "start"]

# Usando a imagem Node base (alpine) para uma construção mais leve
FROM node:alpine

# Diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copiar apenas o package.json da pasta 'api' para instalar as dependências
COPY api/package.json ./

# Instalar as dependências (agora no diretório correto)
RUN npm install

# Instalar o Angular CLI globalmente
RUN npm install -g @angular/cli

# Copiar todo o código da pasta 'api' para o container
COPY api /usr/src/app

# Expor a porta 4200
EXPOSE 4200

# Rodar o servidor Angular com o comando ng serve
CMD ["ng", "serve", "--host", "0.0.0.0"]

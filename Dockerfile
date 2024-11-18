# Usando a imagem Node base (alpine) para uma construção mais leve
FROM node:alpine

# Diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copiar apenas o package.json e o package-lock.json para instalar as dependências
COPY app/package.json app/package-lock.json ./app/

# Instalar as dependências (agora no diretório correto)
WORKDIR /usr/src/app/app
RUN npm install

# Instalar o Angular CLI globalmente
RUN npm install -g @angular/cli

# Copiar todo o código para o container
COPY app /usr/src/app/app

# Expor a porta 4200
EXPOSE 4200

# Rodar o servidor Angular com o comando ng serve
CMD ["ng", "serve", "--host", "0.0.0.0"]

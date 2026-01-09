# Guia de Deploy - API Felipe

## 📋 Pré-requisitos

Antes de fazer o deploy no servidor, certifique-se de que:

1. **Docker e Docker Compose instalados no servidor**
   ```bash
   # Verificar instalação
   docker --version
   docker-compose --version
   ```

2. **Acesso SSH ao servidor**
   - Você precisa ter acesso ao servidor onde a API será hospedada

3. **Portas disponíveis**
   - Portas 8001, 8002, 8003 devem estar disponíveis (ou ajuste no docker-compose.yml)

## 🚀 Passos para Deploy

### 1. Preparar o código no servidor

**Opção A: Usando Git (Recomendado)**
```bash
# No servidor, clone o repositório
git clone <seu-repositorio> /caminho/para/api-felipe
cd /caminho/para/api-felipe/api
```

**Opção B: Transferir arquivos via SCP**
```bash
# Do seu computador local
scp -r api/ usuario@servidor:/caminho/para/api-felipe/
```

### 2. Construir e iniciar os containers

```bash
# Navegar para o diretório da API
cd api

# Construir as imagens Docker
docker-compose build

# Iniciar os containers em background
docker-compose up -d

# Verificar se os containers estão rodando
docker-compose ps
```

### 3. Verificar logs

```bash
# Ver logs de todos os serviços
docker-compose logs -f

# Ver logs de um serviço específico
docker-compose logs -f api-1
```

### 4. Testar a API

```bash
# Testar cada instância
curl http://localhost:8001/status
curl http://localhost:8002/status
curl http://localhost:8003/status
```

## 🔧 Comandos Úteis

### Gerenciamento de Containers

```bash
# Parar os containers
docker-compose down

# Parar e remover volumes
docker-compose down -v

# Reiniciar os containers
docker-compose restart

# Reconstruir após mudanças no código
docker-compose up -d --build

# Ver status dos containers
docker-compose ps

# Ver uso de recursos
docker stats
```

### Atualizar a API

```bash
# 1. Fazer pull das mudanças (se usar Git)
git pull

# 2. Reconstruir e reiniciar
docker-compose up -d --build

# 3. Verificar logs
docker-compose logs -f
```

## 🌐 Configuração de Proxy Reverso (Opcional)

Se você quiser usar um único domínio/porta, configure um Nginx como proxy reverso:

```nginx
upstream api_backend {
    server localhost:8001;
    server localhost:8002;
    server localhost:8003;
}

server {
    listen 80;
    server_name seu-dominio.com;

    location / {
        proxy_pass http://api_backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## 🔒 Segurança

1. **Firewall**: Configure o firewall para permitir apenas as portas necessárias
2. **HTTPS**: Configure SSL/TLS usando Let's Encrypt ou outro certificado
3. **Variáveis de Ambiente**: Use arquivos `.env` para configurações sensíveis (se necessário)

## 📊 Monitoramento

```bash
# Ver uso de recursos em tempo real
docker stats

# Ver logs recentes
docker-compose logs --tail=100

# Verificar saúde dos containers
docker-compose ps
```

## 🐛 Troubleshooting

### Container não inicia
```bash
# Ver logs detalhados
docker-compose logs api-1

# Verificar se a porta está em uso
netstat -tulpn | grep 8001
```

### Reconstruir do zero
```bash
# Parar tudo
docker-compose down

# Remover imagens antigas
docker-compose rm -f

# Reconstruir
docker-compose build --no-cache
docker-compose up -d
```

## 📝 Notas

- Os containers estão configurados com `restart: unless-stopped`, então reiniciam automaticamente após reinicialização do servidor
- Cada instância roda na porta 8000 internamente, mas são expostas nas portas 8001, 8002 e 8003
- Todas as instâncias compartilham a mesma rede Docker (`api-network`)

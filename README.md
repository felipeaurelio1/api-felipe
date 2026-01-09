# API Felipe

API FastAPI com suporte a múltiplas instâncias via Docker.

## 🚀 Tecnologias

- **FastAPI** - Framework web moderno e rápido
- **Uvicorn** - Servidor ASGI de alta performance
- **Docker** - Containerização
- **Docker Compose** - Orquestração de múltiplos containers

## 📁 Estrutura do Projeto

```
api-felipe/
├── api/
│   ├── bud.py              # Aplicação FastAPI
│   ├── requirements.txt    # Dependências Python
│   ├── Dockerfile          # Imagem Docker (para deploy local)
│   ├── docker-compose.yml  # Configuração multi-container
│   └── deploy.sh          # Script de deploy
├── Dockerfile              # Dockerfile na raiz (para Railway)
├── railway.json            # Configuração Railway (JSON)
├── railway.toml            # Configuração Railway (TOML)
├── DEPLOY.md              # Guia completo de deploy
├── RAILWAY.md             # Guia de deploy no Railway
├── GITHUB.md              # Guia para GitHub
└── README.md              # Este arquivo
```

## 🏃 Executando Localmente

### Com Docker Compose (Recomendado)

```bash
cd api
docker-compose up -d
```

A API estará disponível em:
- http://localhost:8001
- http://localhost:8002
- http://localhost:8003

### Sem Docker

```bash
cd api
pip install -r requirements.txt
uvicorn bud:app --reload
```

## 📝 Endpoints

- `GET /` - Hello World
- `GET /alice` - Alice Saúde
- `GET /about` - Sobre a aplicação
- `GET /status` - Status da API

## 🛠️ Scripts de Deploy

Use o script `deploy.sh` para facilitar o gerenciamento:

```bash
./deploy.sh build    # Construir imagens
./deploy.sh start    # Iniciar containers
./deploy.sh stop     # Parar containers
./deploy.sh restart  # Reiniciar containers
./deploy.sh logs     # Ver logs
./deploy.sh status   # Ver status
./deploy.sh test     # Testar endpoints
./deploy.sh update   # Atualizar após mudanças
```

## 🚂 Deploy no Railway

Este projeto está configurado para deploy automático no Railway via GitHub.

**Passos rápidos:**
1. Faça push do código para o GitHub
2. Acesse [Railway](https://railway.app) e conecte seu repositório
3. O Railway fará deploy automático!

Para instruções detalhadas, consulte [RAILWAY.md](./RAILWAY.md).

## 📚 Documentação

- [DEPLOY.md](./DEPLOY.md) - Guia completo de deploy em servidor próprio
- [RAILWAY.md](./RAILWAY.md) - Guia de deploy no Railway
- [GITHUB.md](./GITHUB.md) - Como subir código para o GitHub

## 📄 Licença

Este projeto é de uso pessoal.

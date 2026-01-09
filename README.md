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
│   ├── Dockerfile          # Imagem Docker
│   ├── docker-compose.yml  # Configuração multi-container
│   └── deploy.sh          # Script de deploy
├── DEPLOY.md              # Guia completo de deploy
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

## 📚 Documentação

Para instruções detalhadas de deploy no servidor, consulte [DEPLOY.md](./DEPLOY.md).

## 📄 Licença

Este projeto é de uso pessoal.

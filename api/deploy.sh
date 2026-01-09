#!/bin/bash

# Script de deploy para API Felipe
# Uso: ./deploy.sh [build|start|stop|restart|logs|status]

set -e

COMMAND=${1:-help}

case $COMMAND in
  build)
    echo "🔨 Construindo imagens Docker..."
    docker-compose build
    echo "✅ Build concluído!"
    ;;
  
  start)
    echo "🚀 Iniciando containers..."
    docker-compose up -d
    echo "✅ Containers iniciados!"
    echo ""
    echo "📊 Status dos containers:"
    docker-compose ps
    ;;
  
  stop)
    echo "🛑 Parando containers..."
    docker-compose down
    echo "✅ Containers parados!"
    ;;
  
  restart)
    echo "🔄 Reiniciando containers..."
    docker-compose restart
    echo "✅ Containers reiniciados!"
    ;;
  
  logs)
    echo "📋 Exibindo logs (Ctrl+C para sair)..."
    docker-compose logs -f
    ;;
  
  status)
    echo "📊 Status dos containers:"
    docker-compose ps
    echo ""
    echo "💾 Uso de recursos:"
    docker stats --no-stream
    ;;
  
  update)
    echo "🔄 Atualizando API..."
    echo "1. Parando containers..."
    docker-compose down
    echo "2. Reconstruindo imagens..."
    docker-compose build --no-cache
    echo "3. Iniciando containers..."
    docker-compose up -d
    echo "✅ Atualização concluída!"
    echo ""
    echo "📊 Status dos containers:"
    docker-compose ps
    ;;
  
  test)
    echo "🧪 Testando endpoints..."
    echo ""
    echo "Testando API-1 (porta 8001):"
    curl -s http://localhost:8001/status || echo "❌ Falha ao conectar"
    echo ""
    echo "Testando API-2 (porta 8002):"
    curl -s http://localhost:8002/status || echo "❌ Falha ao conectar"
    echo ""
    echo "Testando API-3 (porta 8003):"
    curl -s http://localhost:8003/status || echo "❌ Falha ao conectar"
    ;;
  
  help|*)
    echo "📖 Uso: ./deploy.sh [comando]"
    echo ""
    echo "Comandos disponíveis:"
    echo "  build    - Construir as imagens Docker"
    echo "  start    - Iniciar os containers"
    echo "  stop     - Parar os containers"
    echo "  restart  - Reiniciar os containers"
    echo "  logs     - Ver logs em tempo real"
    echo "  status   - Ver status e uso de recursos"
    echo "  update   - Atualizar e reconstruir tudo"
    echo "  test     - Testar os endpoints da API"
    echo "  help     - Mostrar esta ajuda"
    ;;
esac

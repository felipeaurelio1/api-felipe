#!/bin/sh
# Script de inicialização para Railway
# Garante que a variável PORT seja expandida corretamente

PORT=${PORT:-8000}

exec uvicorn bud:app --host 0.0.0.0 --port "$PORT"

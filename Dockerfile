# Dockerfile na raiz para Railway (alternativa)
# Utilizando a imagem leve e oficial do Python
FROM python:3.11-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências
COPY api/requirements.txt .

# Instala as dependências Python
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY api/bud.py .

# Cria um usuário não-root para segurança
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser

# Expõe a porta (Railway define via variável de ambiente PORT)
# EXPOSE aceita apenas números, mas Railway usa variável PORT dinamicamente
EXPOSE 8000

# Comando para iniciar a aplicação FastAPI
# Railway define a variável PORT automaticamente, usa 8000 como fallback
CMD ["sh", "-c", "uvicorn bud:app --host 0.0.0.0 --port ${PORT:-8000}"]

# Utilizando a imagem leve e oficial do Python, devido ao tamanho do projeto.
FROM python:3.11-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências
COPY requirements.txt .

# Instala as dependências Python
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY bud.py .

# Cria um usuário não-root para segurança
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser

# Expõe a porta 8000 (porta padrão do uvicorn)
EXPOSE 8000

# Comando para iniciar a aplicação FastAPI
CMD ["uvicorn", "bud:app", "--host", "0.0.0.0", "--port", "8000"]

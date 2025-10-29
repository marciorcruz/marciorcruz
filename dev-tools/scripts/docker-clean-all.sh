#!/bin/bash
echo "🧹 Parando containers..."
docker stop $(docker ps -aq) 2>/dev/null

echo "🗑️  Removendo containers..."
docker rm $(docker ps -aq) 2>/dev/null

echo "🧱 Removendo imagens..."
docker rmi -f $(docker images -q) 2>/dev/null

echo "📦 Removendo volumes..."
docker volume rm $(docker volume ls -q) 2>/dev/null

echo "🌐 Removendo redes (exceto padrões)..."
docker network rm $(docker network ls -q | grep -v "bridge\\|host\\|none") 2>/dev/null

echo "🧽 Limpando cache..."
docker system prune -a --volumes -f

echo "✅ Docker limpo!"
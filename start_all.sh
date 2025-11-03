#!/bin/bash

# Crear carpeta de logs si no existe
mkdir -p /home/ubuntu/logs

# 1. pipeline_postgres.py con eatapg_env311
echo "Iniciando pipeline_postgres.py..."
source /home/ubuntu/eatapg_env311/bin/activate
nohup python /home/ubuntu/CTIC/EATA_PG/pipeline_postgres.py > /home/ubuntu/logs/pipeline_postgres.log 2>&1 &
deactivate

# 2. main.py con EataPy
echo "Iniciando main.py..."
source /home/ubuntu/EataPy/bin/activate
nohup python /home/ubuntu/CTIC/NewEATA/main.py > /home/ubuntu/logs/main.log 2>&1 &
deactivate

# 3. index.py de Flask
echo "Iniciando index.py (Flask)..."
source /home/ubuntu/flask_dir/venv/bin/activate
nohup python /home/ubuntu/flask_dir/mi_proyecto_flask/eata-project/index.py > /home/ubuntu/logs/flask.log 2>&1 &
deactivate

# 4. Node.js server
echo "Iniciando server.js (Node.js)..."
nohup node /home/ubuntu/DB_CON/server.js > /home/ubuntu/logs/server_node.log 2>&1 &

echo "Todos los procesos han sido lanzados en segundo plano."

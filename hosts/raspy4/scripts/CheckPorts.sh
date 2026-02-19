#!/bin/bash

# Solicitar al usuario los puertos
read -p "Introduce los puertos separados por espacio: " -a ports

# Función para verificar un puerto
check_port() {
    local port=$1
    local found_process=false
    local process_lines

    process_lines=$(sudo lsof -i :$port -nP -sTCP:LISTEN | grep LISTEN)

    if [ -n "$process_lines" ]; then
        while IFS= read -r process_line; do
            pid=$(echo "$process_line" | awk '{print $2}')
            process_name=$(ps -p $pid -o comm= | head -n 1)

            if [ -n "$process_name" ]; then
                if [[ "$process_name" == "docker-proxy" ]]; then
                    container_id=$(sudo docker ps --filter "status=running" --filter "publish=$port" --format "{{.ID}}" | head -n 1)
                    container_name=$(sudo docker inspect --format '{{.Name}}' $container_id 2>/dev/null | sed 's/^\///')

                    if [ -n "$container_name" ]; then
                        echo "El puerto $port está siendo utilizado por el contenedor Docker: $container_name"
                    else
                        echo "El puerto $port está siendo utilizado por un contenedor Docker sin nombre identificado"
                    fi
                else
                    echo "El puerto $port está siendo utilizado por el proceso: $process_name (PID: $pid)"
                fi
                found_process=true
            fi
        done <<< "$process_lines"
    fi

    if [ "$found_process" = false ]; then
        echo "No se encontró ningún proceso utilizando el puerto $port"
    fi
}

# Iterar sobre cada puerto proporcionado por el usuario
for port in "${ports[@]}"; do
    check_port $port
done

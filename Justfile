compose := "docker compose"

hello:
    echo "Hello, world!"

up:
    # {{compose}} up -d --build db api web mailpit
    {{compose}} -f ./src/compose.yml up -d --build

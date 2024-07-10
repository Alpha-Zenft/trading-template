set dotenv-load

default:
	just --list --unsorted

# ============================================= #
# Dev Section
# ============================================= #
install:
  rye sync
  rye run pre-commit install --hook-type pre-push --hook-type commit-msg

cz:
  rye run cz commit --write-message-to-file /tmp/msg

czr:
  rye run cz commit --write-message-to-file /tmp/msg --retry

cleanup:
  rm -f /tmp/msg

local_docker:
  #!/usr/bin/env bash
  sudo chown -R 472:472 ./docker/grafana_data
  sudo chown -R 472:472 ./docker/provisioning
  docker compose -f docker/docker-compose.yml up

# ============================================= #
# Code Section
# ============================================= #
pre-commit-test:
  rye run pre-commit run

dev:
  nodemon -e py --exec rye run dev

rs_dev:
  #!/usr/bin/env bash
  cd rs
  nodemon -w rs -e rs --exec maturin develop --skip-install -r --uv

# ============================================= #
# Custom Section
# ============================================= #
custom:
  echo "Do whatever you want here"

name: Truffeo - Sync Hofman

on:
  schedule:
    # 4 fois par jour (UTC) : 05h, 10h, 14h, 19h — economise les minutes Actions
    - cron: "0 5,10,14,19 * * *"
  workflow_dispatch:
    inputs:
      dry_run:
        description: "Simulation (aucune ecriture)"
        type: boolean
        default: false
      send_orders:
        description: "Transmettre reellement les commandes a Hofman"
        type: boolean
        default: false

concurrency:
  group: truffeo-sync
  cancel-in-progress: false

jobs:
  sync:
    runs-on: ubuntu-latest
    timeout-minutes: 45
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - run: pip install requests

      - name: Synchronisation
        env:
          HOFMAN_API_KEY: ${{ secrets.HOFMAN_API_KEY }}
          SHOPIFY_TOKEN:  ${{ secrets.SHOPIFY_TOKEN }}
          SHOPIFY_STORE:  ${{ secrets.SHOPIFY_STORE }}
          HOFMAN_LOCATION_NAME: Hofman
          DRY_RUN:     ${{ inputs.dry_run || 'false' }}
          SEND_ORDERS: ${{ inputs.send_orders || 'false' }}
        run: python truffeo_sync.py

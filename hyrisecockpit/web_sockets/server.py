"""Backendserver to provide required data per websockets."""
import asyncio
import time

import websockets

from hyrisecockpit import settings as s


async def runtime_data(websocket, path):
    """Provide dummy runtime data."""
    while 1:
        await websocket.send(f"throughput = 5")
        await websocket.send(f"queue length = 5")
        await websocket.send(f"storage_data = 5")
        time.sleep(1)


throughput_server = websockets.serve(
    runtime_data, f"{s.WEBSOCKET_HOST}", s.WEBSOCKET_PORT
)

asyncio.get_event_loop().run_until_complete(throughput_server)
asyncio.get_event_loop().run_forever()

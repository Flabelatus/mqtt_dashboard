# MQTT Dashboard

A simple MQTT-based dashboard built with Flask, Flask-SocketIO, and Paho MQTT client. This project connects to an MQTT broker, subscribes to a topic (e.g., temperature sensor data), and updates a real-time dashboard using WebSockets.

## Features
- Flask web application with a real-time dashboard.
- Integration with an MQTT broker (e.g., Mosquitto).
- Real-time communication using Flask-SocketIO.
- Broadcasts MQTT sensor data to all connected clients.

## Prerequisites
Before running this project, make sure you have the following installed on your system:

1. Python 3.6+
2. `pip` (Python package manager)
3. An MQTT broker (e.g., Mosquitto)

### Installing Mosquitto (MQTT Broker)
You can install Mosquitto using the script provided in this repository. Run the following command:

```bash
./install_mqtt.sh
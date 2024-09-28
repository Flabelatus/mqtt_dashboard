import paho.mqtt.client as mqtt
from flask import Flask, render_template
from flask_socketio import SocketIO, emit

# Initialize Flask app
app = Flask(__name__)
socketio = SocketIO(app, cors_allowed_origins="*")  # Enable CORS for all origins

# MQTT settings
broker_address = "127.0.0.1"  # Localhost
mqtt_topic = "sensor/temperature"

# Flask route for the dashboard
@app.route('/')
def index():
    return render_template('dashboard.html')

# MQTT callbacks
def on_connect(client, userdata, flags, rc):
    print("Connected with result code " + str(rc))
    client.subscribe(mqtt_topic)

def on_message(client, userdata, msg):
    temperature = msg.payload.decode()
    print(f"Received MQTT message: {temperature}")
    
    # Emit the message via WebSocket to the dashboard
    socketio.emit('mqtt_message', {'temperature': temperature})
    print(f"Emitted temperature {temperature} to WebSocket")

# MQTT setup
mqtt_client = mqtt.Client()
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message
mqtt_client.connect(broker_address, 1883, 60)
mqtt_client.loop_start()

# Start Flask-SocketIO server
if __name__ == '__main__':
    socketio.run(app, debug=True)
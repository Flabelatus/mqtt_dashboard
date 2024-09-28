import paho.mqtt.client as mqtt

broker_address = "127.0.0.1"
client = mqtt.Client()
client.connect(broker_address, 1883, 60)

client.publish("sensor/temperature", "25.6")
client.disconnect()
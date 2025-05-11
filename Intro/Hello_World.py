import json

message = open("text.json", "r")
data = json.load(message)

# Access and print the 'message' key
print(data["message"])

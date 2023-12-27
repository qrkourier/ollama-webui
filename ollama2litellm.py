import requests
import yaml
import copy

# Fetch the list of models
response = requests.get('http://ollama.private/api/tags')
models = [model['name'] for model in response.json()['models']]

# Define the template
template = {
  "model_name": "MODEL",
  "litellm_params": {
    "model": "MODEL",
    "api_base": "http://ollama:11434",
    "stream": False
  }
}

# Build the model_list
model_list = []
for model in models:
    new_item = copy.deepcopy(template)
    new_item['model_name'] = model
    new_item['litellm_params']['model'] = f"ollama/{model}"
    model_list.append(new_item)

litellm_config = {
    "model_list": model_list
}
# Print the result
print(yaml.dump(litellm_config))

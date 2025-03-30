from llama_cpp import Llama

# Load the model
llm = Llama(model_path='./models/gemma-3-4b-it.Q4_K_M.gguf?download=true')

# Define a prompt
prompt = "What is the capital of France?"

output = llm(prompt, max_tokens=20, stop=["/n"]) # Increase token limit and set stop sequences

# Extract and print only the response text
response_text = output.get("choices", [{}])[0].get("text", "").strip()
print(response_text)


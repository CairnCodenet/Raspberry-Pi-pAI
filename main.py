from llama_cpp import Llama

def main():
    model_path = "models/Llama-3.2-3B-Instruct-Q4_K_S.gguf?download=true"
    llm = Llama(model_path=model_path, verbose=False)
    
    while True:
        user_input = input("You: ")
        if user_input.lower() in {"exit", "quit"}:
            print("Exiting...")
            break
        
        response = llm(user_input)["choices"][0]["text"].strip()
        print(f"AI: {response}")

if __name__ == "__main__":
    main()
 
